import 'package:flutter/material.dart';
import 'package:flutter_movies/helper/image_helper.dart';
import 'package:flutter_movies/models/movie.dart';
import 'package:flutter_movies/screen/movie_detail.dart';
import 'package:transparent_image/transparent_image.dart';

class PopularMoviesList extends StatelessWidget {
  final List<Movie> items;

  const PopularMoviesList({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];
          return GridTile(
              header: Text(item.title),
              footer: Text(item.release_date),
              child: InkResponse(
                enableFeedback: true,
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: ImageHelper.buildPosterUrlFromPath(item.poster_path),
                  fit: BoxFit.cover,
                ),
                onTap: () => _openDetail(context, item),
              ));
        });
  }

  _openDetail(BuildContext context, Movie movie) {
    Navigator.pushNamed(context, MovieDetailScreen.routeName,
        arguments: MovieDetailScreenArguments(movie.title, movie.id));
  }
}
