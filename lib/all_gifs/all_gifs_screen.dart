import 'package:Test_task/fav_gifs/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Test_task/all_gifs/index.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class AllGifsScreen extends StatefulWidget {
  const AllGifsScreen({
    Key key,
  }) : super(key: key);

  @override
  AllGifsScreenState createState() {
    return AllGifsScreenState();
  }
}

class AllGifsScreenState extends State<AllGifsScreen> {
  AllGifsScreenState();
  final _scrollController = ScrollController();
  AllGifsBloc _gifsBloc;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _gifsBloc = BlocProvider.of<AllGifsBloc>(context);
    _load();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) _gifsBloc.add(LoadAllGifsEvent());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FavGifsBloc, FavGifsState>(
      listener: (context, state) {
        if (state is StatusFavGifsState) {
          Scaffold.of(context).hideCurrentSnackBar();
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text(state.status)));
        }
      },
      child: BlocConsumer<AllGifsBloc, InAllGifsState>(
        listener: (context, state) {
          if (!state.hasReachedMax && _isBottom) {
            _gifsBloc.add(LoadAllGifsEvent());
          }
        },
        builder: (context, state) {
          switch (state.status) {
            case GifStatus.failure:
              return const Center(child: Text('failed to fetch posts'));
            case GifStatus.success:
              if (state.gifs.isEmpty) {
                return const Center(child: Text('no posts'));
              }
              return StaggeredGridView.countBuilder(
                crossAxisCount: 4,
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
                staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
                itemBuilder: (BuildContext context, int index) {
                  return index >= state.gifs.length
                      ? BottomLoader()
                      : Card(
                          elevation: 5,
                          child: Stack(
                            children: [
                              Center(
                                child: Image.network(
                                  state.gifs[index].images.original.url,
                                  alignment: Alignment.center,
                                  fit: BoxFit.fill,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  },
                                ),
                              ),
                              IconButton(
                                  icon: Icon(
                                    Icons.favorite,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    BlocProvider.of<FavGifsBloc>(context).add(
                                        AddFavGifsEvent(state.gifs[index]));
                                  })
                            ],
                          ),
                        );
                },
                itemCount: state.hasReachedMax
                    ? state.gifs.length
                    : state.gifs.length + 1,
                controller: _scrollController,
              );
            default:
              return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  void _load() {
    _gifsBloc.add(LoadAllGifsEvent());
  }
}

class BottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 24,
        width: 24,
        child: CircularProgressIndicator(strokeWidth: 1.5),
      ),
    );
  }
}
