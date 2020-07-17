import 'package:flutter_movies/data/movies_repository.dart';
import 'package:flutter_movies/models/movie.dart';

class GetPopularMovies {
  final _repository = MoviesRepository();

  Stream<GetPopularMoviesState> stream() async* {
    yield GetPopularMoviesLoadingState();
    try {
      final result = await _repository.getPopularMovies();
      if (result.isEmpty) {
        yield GetPopularMoviesEmptyState();
      } else {
        yield GetPopularMoviesContentState(result);
      }
    } catch (e) {
      yield GetPopularMoviesErrorState();
    }
  }
}

// states

abstract class GetPopularMoviesState {
  const GetPopularMoviesState();
}

class GetPopularMoviesLoadingState extends GetPopularMoviesState {}

class GetPopularMoviesEmptyState extends GetPopularMoviesState {}

class GetPopularMoviesErrorState extends GetPopularMoviesState {}

class GetPopularMoviesContentState extends GetPopularMoviesState {
  final List<Movie> movies;
  GetPopularMoviesContentState(this.movies);
}
