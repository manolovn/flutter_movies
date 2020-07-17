import 'package:flutter_movies/models/index.dart';

// get movies states

abstract class GetMoviesState {
  const GetMoviesState();
}

class GetMoviesLoadingState extends GetMoviesState {}

class GetMoviesEmptyState extends GetMoviesState {}

class GetMoviesErrorState extends GetMoviesState {}

class GetMoviesContentState extends GetMoviesState {
  final List<Movie> movies;
  GetMoviesContentState(this.movies);
}

// get movie states

abstract class GetMovieState {
  const GetMovieState();
}

class GetMovieLoadingState extends GetMovieState {}

class GetMovieEmptyState extends GetMovieState {}

class GetMovieErrorState extends GetMovieState {}

class GetMovieContentState extends GetMovieState {
  final Movie movie;
  GetMovieContentState(this.movie);
}
