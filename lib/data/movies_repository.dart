import 'dart:async';
import 'dart:convert';
import 'package:flutter_movies/domain/movie.dart';
import 'package:http/http.dart' as http;

class MoviesRepository {
  final http.Client client = http.Client();
  final _apiKey = '';
  final _baseUrl = "https://api.themoviedb.org/3/movie";

  Future<List<Movie>> getPopularMovies() async {
    final result = await _fetchResults();
    return result.results;
  }

  Future<Response> _fetchResults() async {
    final response =
        await client.get(Uri.parse("$_baseUrl/popular?api_key=$_apiKey"));
    if (response.statusCode == 200) {
      return Response.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load popular movies');
    }
  }
}
