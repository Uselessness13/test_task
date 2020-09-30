import 'package:flutter/material.dart';
import 'package:Test_task/fav_gifs/index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavGifsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FavGifs'),
      ),
      body: FavGifsScreen(favGifsBloc: BlocProvider.of<FavGifsBloc>(context)),
    );
  }
}
