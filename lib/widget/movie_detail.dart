import 'package:flutter/material.dart';
import 'package:flutter_movies/helper/image_helper.dart';
import 'package:flutter_movies/models/index.dart';

class MovieDetail extends StatelessWidget {
  final Movie item;

  const MovieDetail({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Image.network(ImageHelper.buildPosterUrlFromPath(
                item.poster_path, ImageSize.big)),
            Text(item.overview),
            Text(item.release_date),
          ],
        ),
      ),
    );
  }
}
