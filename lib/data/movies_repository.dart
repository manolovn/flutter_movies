import 'dart:async';
import 'dart:convert';
import 'package:flutter_movies/domain/response.dart';
import 'package:flutter_movies/helper/config.dart';
import 'package:flutter_movies/models/movie.dart';
import 'package:http/http.dart' as http;

class MoviesRepository {
  final http.Client client = http.Client();
  String _apiKey = '';
  final _baseUrl = "https://api.themoviedb.org/3";

  MoviesRepository() {
    ConfigLoader().load().then((config) => _apiKey = config.apiKey);
  }

  Future<List<Movie>> getPopularMovies() async {
    final result = await _fetchResults('popular');
    return result.results;
  }

  Future<List<Movie>> getTopRatedMovies() async {
    final result = await _fetchResults('top_rated');
    return result.results;
  }

  Future<List<Movie>> getNowPlayingMovies() async {
    final result = await _fetchResults('now_playing');
    return result.results;
  }

  Future<Response> _fetchResults(String type) async {
    final response =
        await client.get(Uri.parse("$_baseUrl/movie/$type?api_key=$_apiKey"));
    if (response.statusCode == 200) {
      return Response.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load popular movies');
    }
  }

  Future<Movie> getMovie(int movieId) async {
    return await _fetchMovie(movieId.toString());
  }

  Future<Movie> _fetchMovie(String movieId) async {
    final response = await client
        .get(Uri.parse("$_baseUrl/movie/$movieId?api_key=$_apiKey"));
    if (response.statusCode == 200) {
      return Movie.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load movie');
    }
  }
}
