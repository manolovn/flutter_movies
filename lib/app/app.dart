import 'package:flutter/material.dart';
import 'package:flutter_movies/screen/home.dart';
import 'package:flutter_movies/screen/movie_detail.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        MovieDetailScreen.routeName: (context) => MovieDetailScreen(),
      },
    );
  }
}
