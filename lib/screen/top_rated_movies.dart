import 'package:flutter/material.dart';
import 'package:flutter_movies/bloc/get_top_rated_movies.dart';
import 'package:flutter_movies/bloc/states.dart';
import 'package:flutter_movies/widget/error.dart';
import 'package:flutter_movies/widget/loading.dart';
import 'package:flutter_movies/widget/popular_movies_list.dart';

class TopRatedMoviesScreen extends StatefulWidget {
  @override
  _TopRatedMoviesScreenState createState() => _TopRatedMoviesScreenState();
}

class _TopRatedMoviesScreenState extends State<TopRatedMoviesScreen> {
  GetTopRatedMovies getTopRatedMovies;

  @override
  void initState() {
    super.initState();

    getTopRatedMovies = GetTopRatedMovies();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: getTopRatedMovies.stream(),
        builder:
            (BuildContext context, AsyncSnapshot<GetMoviesState> snapshot) {
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
