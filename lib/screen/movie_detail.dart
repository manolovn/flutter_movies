import 'package:flutter/material.dart';
import 'package:flutter_movies/bloc/get_movie.dart';
import 'package:flutter_movies/bloc/states.dart';
import 'package:flutter_movies/widget/error.dart';
import 'package:flutter_movies/widget/loading.dart';
import 'package:flutter_movies/widget/movie_detail.dart';

class MovieDetailScreen extends StatefulWidget {
  static const routeName = '/detail';

  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  GetMovie getMovie;

  @override
  void initState() {
    super.initState();

    getMovie = GetMovie();
  }

  @override
  Widget build(BuildContext context) {
    final MovieDetailScreenArguments args =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.title == null ? 'Loading...' : args.title),
        centerTitle: true,
      ),
      body: StreamBuilder(
          stream: getMovie.stream(args.movieId),
          builder:
              (BuildContext context, AsyncSnapshot<GetMovieState> snapshot) {
            final state = snapshot.data;
            return Center(
              child: _renderState(state),
            );
          }),
    );
  }

  _renderState(GetMovieState state) {
    if (state is GetMovieContentState) {
      return MovieDetail(item: state.movie);
    }
    if (state is GetMovieErrorState) {
      return ErrorCaseWidget();
    }
    return LoadingWidget();
  }
}

class MovieDetailScreenArguments {
  final String title;
  final int movieId;

  MovieDetailScreenArguments(this.title, this.movieId);
}
