import 'package:viemo/kinopoisk_api/kinopoisk_api.dart';
import '../../../storage/storage.dart';

extension MovieRMtoCM on MovieRM {
  MovieCM toCacheModel() {
    return MovieCM(
      id: id,
      title: title,
      rating: rating.toCacheModel(),
      duration: duration,
      type: type,
      description: description,
      year: year,
      poster: poster.toCacheModel(),
      genres: genres.map((e) => e.name.toString()).toList(),
      countries: countries.map((e) => e.name.toString()).toList(),
      alternativeName: alternativeName,
    );
  }
}

extension MovieListPageRMtoCM on MovieListPageRM {
  MovieListPageCM toCacheModel() {
    return MovieListPageCM(
      movieList: movieList.map((movie) => movie.toCacheModel()).toList(),
      totalPages: totalPages,
    );
  }
}

extension RatingRMtCache on RatingRM {
  RatingCM toCacheModel() {
    return RatingCM(
      kpRating: kpRating,
      imdbRating: imdbRating,
    );
  }
}

extension PosterRMtCache on PosterRM {
  PosterCM toCacheModel() {
    return PosterCM(
      url: url,
      previewUrl: previewUrl,
    );
  }
}
