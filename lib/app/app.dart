import 'package:flutter/material.dart';
import 'package:flutter_movies/screen/home.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: HomeScreen(title: 'Home Screen'),
    );
  }
}
