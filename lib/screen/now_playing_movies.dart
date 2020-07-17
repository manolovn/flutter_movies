import 'package:flutter/material.dart';
import 'package:flutter_movies/bloc/get_now_playing_movies.dart';
import 'package:flutter_movies/bloc/states.dart';
import 'package:flutter_movies/widget/error.dart';
import 'package:flutter_movies/widget/loading.dart';
import 'package:flutter_movies/widget/popular_movies_list.dart';

class NowPlayingMoviesScreen extends StatefulWidget {
  @override
  _NowPlayingMoviesScreenState createState() => _NowPlayingMoviesScreenState();
}

class _NowPlayingMoviesScreenState extends State<NowPlayingMoviesScreen> {
  GetNowPlayingMovies getNowPlayingMovies;

  @override
  void initState() {
    super.initState();

    getNowPlayingMovies = GetNowPlayingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: getNowPlayingMovies.stream(),
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
