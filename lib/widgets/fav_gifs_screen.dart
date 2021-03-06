import 'package:Test_task/widgets/gif_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Test_task/fav_gifs/index.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class FavGifsScreen extends StatefulWidget {
  const FavGifsScreen({
    Key key,
    @required FavGifsBloc favGifsBloc,
  })  : _favGifsBloc = favGifsBloc,
        super(key: key);

  final FavGifsBloc _favGifsBloc;

  @override
  FavGifsScreenState createState() {
    return FavGifsScreenState();
  }
}

class FavGifsScreenState extends State<FavGifsScreen> {
  FavGifsScreenState();

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavGifsBloc, FavGifsState>(
        cubit: widget._favGifsBloc,
        listener: (context, state) {
          if (state is DeletedFavGifsState) {
            Scaffold.of(context).hideCurrentSnackBar();
            Scaffold.of(context).showSnackBar(
                SnackBar(content: Text("Гифка удалена из избранного")));
          }
        },
        buildWhen: (previous, current) => true,
        builder: (
          BuildContext context,
          FavGifsState currentState,
        ) {
          if (currentState is UnFavGifsState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (currentState is InFavGifsState) {
            return currentState.gifs.length > 0
                ? StaggeredGridView.countBuilder(
                    crossAxisCount: 4,
                    mainAxisSpacing: 4.0,
                    crossAxisSpacing: 4.0,
                    staggeredTileBuilder: (int index) =>
                        new StaggeredTile.fit(2),
                    itemBuilder: (BuildContext context, int index) {
                      return GifItem(
                        gifInfo: currentState.gifs[index],
                        fav: true,
                      );
                    },
                    itemCount: currentState.gifs.length,
                  )
                : Center(
                    child: Text(
                      'Нет избранных гифок',
                      style: Theme.of(context).textTheme.headline3,
                      softWrap: true,
                      textAlign: TextAlign.center,
                    ),
                  );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  void _load() {
    widget._favGifsBloc.add(LoadFavGifsEvent());
  }
}
