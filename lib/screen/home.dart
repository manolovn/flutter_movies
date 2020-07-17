import 'package:flutter/material.dart';
import 'package:flutter_movies/screen/top_rated_movies.dart';
import 'package:flutter_movies/screen/popular_movies.dart';
import 'package:flutter_movies/screen/now_playing_movies.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgets = <Widget>[
    PopularMoviesScreen(),
    TopRatedMoviesScreen(),
    NowPlayingMoviesScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter movies'),
        ),
        body: _widgets.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Popular'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assessment),
              title: Text('Top rated'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.camera_roll),
              title: Text('Now playing'),
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ));
  }
}
