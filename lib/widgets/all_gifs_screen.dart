import 'dart:async';

import 'package:Test_task/blocs/all_gifs/all_gifs_bloc.dart';
import 'package:Test_task/fav_gifs/index.dart';
import 'package:Test_task/widgets/bottom_loader.dart';
import 'package:Test_task/widgets/gif_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  Completer<void> _refreshCompleter;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _gifsBloc = BlocProvider.of<AllGifsBloc>(context);
    _refreshCompleter = Completer<void>();
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
          _refreshCompleter?.complete();
          _refreshCompleter = Completer();
        },
        builder: (context, state) {
          switch (state.status) {
            case GifStatus.failure:
              return const Center(child: Text('failed to fetch posts'));
            case GifStatus.success:
              if (state.gifs.isEmpty) {
                return const Center(child: Text('no posts'));
              }
              return RefreshIndicator(
                onRefresh: () {
                  BlocProvider.of<AllGifsBloc>(context).add(ClearGifsEvent());
                  return _refreshCompleter.future;
                },
                child: StaggeredGridView.countBuilder(
                  crossAxisCount: 4,
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                  staggeredTileBuilder: (int index) =>
                      new StaggeredTile.fit(index >= state.gifs.length ? 4 : 2),
                  itemBuilder: (BuildContext context, int index) {
                    return index >= state.gifs.length
                        ? BottomLoader()
                        : GifItem(
                            gifInfo: state.gifs[index],
                            fav: false,
                          );
                  },
                  itemCount: state.hasReachedMax
                      ? state.gifs.length
                      : state.gifs.length + 1,
                  controller: _scrollController,
                ),
              );
            default:
              return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
