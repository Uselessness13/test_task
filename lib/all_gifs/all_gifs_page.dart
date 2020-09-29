import 'package:Test_task/fav_gifs/index.dart';
import 'package:flutter/material.dart';
import 'package:Test_task/all_gifs/index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllGifsPage extends StatefulWidget {
  static const String routeName = '/allGifs';

  @override
  _AllGifsPageState createState() => _AllGifsPageState();
}

class _AllGifsPageState extends State<AllGifsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AllGifs'),
        actions: [
          IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () async {
                await Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => FavGifsPage()));
                BlocProvider.of<AllGifsBloc>(context).add(ClearGifsEvent());
              })
        ],
      ),
      body: AllGifsScreen(),
    );
  }
}
