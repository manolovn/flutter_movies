import 'package:flutter_movies/data/movies_repository.dart';
import 'package:flutter_movies/models/movie.dart';

class GetMovie {
  final _repository = MoviesRepository();

  Stream<GetMovieState> stream(int movieId) async* {
    yield GetMovieLoadingState();
    try {
      final result = await _repository.getMovie(movieId);
      if (result == null) {
        yield GetMovieEmptyState();
      } else {
        yield GetMovieContentState(result);
      }
    } catch (e) {
      yield GetMovieErrorState();
    }
  }
}

// states

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
