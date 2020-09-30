import 'package:Test_task/blocs/all_gifs/all_gifs_bloc.dart';
import 'package:Test_task/fav_gifs/index.dart';
import 'package:Test_task/widgets/all_gifs_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AllGifsBloc(InAllGifsState())..add(LoadAllGifsEvent()),
          lazy: false,
        ),
        BlocProvider(
          create: (context) =>
              FavGifsBloc(InFavGifsState([]))..add(LoadFavGifsEvent()),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          'home': (context) => AllGifsPage(),
          'fav': (context) => FavGifsPage(),
        },
        initialRoute: 'home',
      ),
    );
  }
}
