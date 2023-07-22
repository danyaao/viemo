import 'package:viemo/kinopoisk_api/kinopoisk_api.dart';
import '../../../domain_models/domain_models.dart';

extension MovieRMtoDomain on MovieRM {
  Movie toDomainModel() {
    return Movie(
      id: id,
      title: title,
      rating: rating.toDomainModel(),
      duration: duration,
      type: type,
      description: description,
      year: year,
      poster: poster.toDomainModel(),
      genres: genres.map((e) => e.name.toString()).toList(),
      countries: countries.map((e) => e.name.toString()).toList(),
      alternativeName: alternativeName,
    );
  }
}

extension MovieListPageRMtoDomain on MovieListPageRM {
  MovieListPage toDomainModel() {
    return MovieListPage(
      movieList: movieList.map((movie) => movie.toDomainModel()).toList(),
      totalPages: totalPages,
    );
  }
}

extension RatingRMtoDomain on RatingRM {
  Rating toDomainModel() {
    return Rating(
      kpRating: kpRating,
      imdbRating: imdbRating,
    );
  }
}

extension PosterRMtoDomain on PosterRM {
  Poster toDomainModel() {
    return Poster(
      url: url,
      previewUrl: previewUrl,
    );
  }
}
