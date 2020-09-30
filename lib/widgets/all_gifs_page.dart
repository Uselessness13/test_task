import 'package:flutter/material.dart';
import 'all_gifs_screen.dart';

class AllGifsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AllGifs'),
        actions: [
          IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () async {
                await Navigator.of(context).pushNamed('fav');
              })
        ],
      ),
      body: AllGifsScreen(),
    );
  }
}
