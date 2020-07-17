import 'package:flutter_movies/data/movies_repository.dart';
import 'package:flutter_movies/bloc/states.dart';

class GetTopRatedMovies {
  final _repository = MoviesRepository();

  Stream<GetMoviesState> stream() async* {
    yield GetMoviesLoadingState();
    try {
      final result = await _repository.getTopRatedMovies();
      if (result.isEmpty) {
        yield GetMoviesEmptyState();
      } else {
        yield GetMoviesContentState(result);
      }
    } catch (e) {
      yield GetMoviesErrorState();
    }
  }
}
