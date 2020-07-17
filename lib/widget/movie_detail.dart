import 'package:flutter/material.dart';
import 'package:flutter_movies/helper/image_helper.dart';
import 'package:flutter_movies/models/index.dart';
import 'package:transparent_image/transparent_image.dart';

class MovieDetail extends StatelessWidget {
  final Movie item;

  const MovieDetail({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: ImageHelper.buildPosterUrlFromPath(
                  item.poster_path, ImageSize.big),
              fit: BoxFit.fill,
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              child: Text(
                item.overview,
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18.0),
              ),
            ),
            Text(item.release_date),
          ],
        ),
      ),
    );
  }
}
