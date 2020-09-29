import 'package:flutter/material.dart';
import 'package:Test_task/fav_gifs/index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavGifsPage extends StatefulWidget {
  static const String routeName = '/favGifs';

  @override
  _FavGifsPageState createState() => _FavGifsPageState();
}

class _FavGifsPageState extends State<FavGifsPage> {
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
