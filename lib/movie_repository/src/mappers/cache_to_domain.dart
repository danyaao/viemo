import '../../../domain_models/domain_models.dart';
import '../../../storage/storage.dart';

extension MovieCMtoDomain on MovieCM {
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
      genres: genres,
      countries: countries,
      alternativeName: alternativeName,
    );
  }
}

extension MovieListPageCMtoDomain on MovieListPageCM {
  MovieListPage toDomainModel() {
    return MovieListPage(
      movieList: movieList.map((movie) => movie.toDomainModel()).toList(),
      totalPages: totalPages,
    );
  }
}

extension RatingCMtoDomain on RatingCM {
  Rating toDomainModel() {
    return Rating(
      kpRating: kpRating,
      imdbRating: imdbRating,
    );
  }
}

extension PosterCMtoDomain on PosterCM {
  Poster toDomainModel() {
    return Poster(
      url: url,
      previewUrl: previewUrl,
    );
  }
}
