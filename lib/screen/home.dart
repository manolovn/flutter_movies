import 'package:flutter/material.dart';
import 'package:flutter_movies/bloc/get_popular_movies.dart';
import 'package:flutter_movies/widget/loading.dart';
import 'package:flutter_movies/widget/error.dart';
import 'package:flutter_movies/widget/popular_movies_list.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GetPopularMovies getPopularMovies;

  @override
  void initState() {
    super.initState();

    getPopularMovies = GetPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: getPopularMovies.stream(),
        builder: (BuildContext context,
            AsyncSnapshot<GetPopularMoviesState> snapshot) {
          final state = snapshot.data;
          return Scaffold(
            appBar: AppBar(
              title: Text('Popular movies'),
            ),
            body: _renderState(state),
          );
        });
  }

  _renderState(GetPopularMoviesState state) {
    if (state is GetPopularMoviesContentState) {
      return PopularMoviesList(items: state.movies);
    }
    if (state is GetPopularMoviesErrorState) {
      return ErrorCaseWidget();
    }
    return LoadingWidget();
  }
}
