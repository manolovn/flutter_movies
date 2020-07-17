import 'package:flutter_movies/bloc/states.dart';
import 'package:flutter_movies/data/movies_repository.dart';

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
