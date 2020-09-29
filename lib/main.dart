import 'package:Test_task/all_gifs/all_gifs_bloc.dart';
import 'package:Test_task/fav_gifs/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'all_gifs/index.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AllGifsBloc(InAllGifsState()),
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
          home: AllGifsPage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // PageController pageController = PageController(
  //   initialPage: 0,
  //   keepPage: true,
  // );
  // int bottomSelectedIndex = 0;

  // List<BottomNavigationBarItem> buildBottomNavBarItems() {
  //   return [
  //     BottomNavigationBarItem(
  //         icon: new Icon(Icons.gif), title: new Text('ALL')),
  //     BottomNavigationBarItem(
  //       icon: new Icon(Icons.star),
  //       title: new Text('FAV'),
  //     ),
  //   ];
  // }

  // void pageChanged(int index) {
  //   setState(() {
  //     bottomSelectedIndex = index;
  //   });
  // }

  // void bottomTapped(int index) {
  //   setState(() {
  //     bottomSelectedIndex = index;
  //     pageController.animateToPage(index,
  //         duration: Duration(milliseconds: 450), curve: Curves.ease);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: AllGifsPage());
  }
}
