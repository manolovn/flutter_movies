import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
    Movie();

    bool adult;
    String backdrop_path;
    String belongs_to_collection;
    num budget;
    List genres;
    String homepage;
    num id;
    String imdb_id;
    String original_language;
    String original_title;
    String overview;
    num popularity;
    String poster_path;
    List production_companies;
    List production_countries;
    String release_date;
    num revenue;
    num runtime;
    List spoken_languages;
    String status;
    String tagline;
    String title;
    bool video;
    num vote_average;
    num vote_count;
    
    factory Movie.fromJson(Map<String,dynamic> json) => _$MovieFromJson(json);
    Map<String, dynamic> toJson() => _$MovieToJson(this);
}
