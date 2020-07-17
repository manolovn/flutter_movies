class ImageHelper {
  static buildPosterUrlFromPath(String poster_path, [ImageSize imageSize]) {
    if (imageSize == null) {
      imageSize = ImageSize.cover;
    }
    String size = imageSize == ImageSize.cover ? "w185" : "w780";
    return 'https://image.tmdb.org/t/p/$size$poster_path';
  }
}

enum ImageSize { cover, big }
