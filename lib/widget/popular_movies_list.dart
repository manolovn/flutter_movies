import 'package:flutter/material.dart';
import 'package:flutter_movies/domain/movie.dart';

class PopularMoviesList extends StatelessWidget {
  final List<Movie> items;

  const PopularMoviesList({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];
          return Center(
              child: InkResponse(
            enableFeedback: true,
            child: Image.network(
              'https://image.tmdb.org/t/p/w185${item.poster_path}',
              fit: BoxFit.cover,
            ),
            onTap: () => _openTrailer(),
          ));
        });
  }

  _openTrailer() {}
}
