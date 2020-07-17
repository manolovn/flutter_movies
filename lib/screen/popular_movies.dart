import 'package:flutter/material.dart';
import 'package:flutter_movies/bloc/get_popular_movies.dart';
import 'package:flutter_movies/bloc/states.dart';
import 'package:flutter_movies/widget/error.dart';
import 'package:flutter_movies/widget/loading.dart';
import 'package:flutter_movies/widget/popular_movies_list.dart';

class PopularMoviesScreen extends StatefulWidget {
  @override
  _PopularMoviesScreenState createState() => _PopularMoviesScreenState();
}

class _PopularMoviesScreenState extends State<PopularMoviesScreen> {
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
            AsyncSnapshot<GetMoviesState> snapshot) {
          final state = snapshot.data;
          return Scaffold(
            body: _renderState(state),
          );
        });
  }

  _renderState(GetMoviesState state) {
    if (state is GetMoviesContentState) {
      return PopularMoviesList(items: state.movies);
    }
    if (state is GetMoviesErrorState) {
      return ErrorCaseWidget();
    }
    return LoadingWidget();
  }
}
