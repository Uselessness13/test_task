import 'package:Test_task/blocs/all_gifs/all_gifs_bloc.dart';
import 'package:Test_task/data/models/gif_info.dart';
import 'package:Test_task/fav_gifs/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GifItem extends StatefulWidget {
  final GifInfo gifInfo;
  final bool fav;
  const GifItem({
    Key key,
    @required this.gifInfo,
    @required this.fav,
  }) : super(key: key);

  @override
  _GifItemState createState() => _GifItemState(gifInfo);
}

class _GifItemState extends State<GifItem> with TickerProviderStateMixin {
  GifInfo gifInfo;
  _GifItemState(this.gifInfo);
  bool faved = false;
  @override
  void initState() {
    faved = gifInfo.innerId != null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: Duration(milliseconds: 150),
      vsync: this,
      child: Card(
        elevation: 5,
        child: Column(
          children: [
            Center(
              child: Image.network(
                widget.gifInfo.url,
                alignment: Alignment.center,
                fit: BoxFit.fill,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            widget.fav
                ? IconButton(
                    icon: Icon(Icons.delete_outline),
                    onPressed: () {
                      BlocProvider.of<FavGifsBloc>(context)
                          .add(RemoveFavGifsEvent(widget.gifInfo));
                    })
                : IconButton(
                    icon: Icon(
                      faved ? Icons.favorite : Icons.favorite_border,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      BlocProvider.of<FavGifsBloc>(context)
                          .add(AddFavGifsEvent(gifInfo));
                      setState(() {
                        faved = true;
                      });
                    })
          ],
        ),
      ),
    );
  }
}
