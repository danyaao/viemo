import 'package:json_annotation/json_annotation.dart';
import 'package:viemo/kinopoisk_api/src/models/response/movie_country_rm.dart';
import 'package:viemo/kinopoisk_api/src/models/response/movie_genre_rm.dart';
import 'package:viemo/kinopoisk_api/src/models/response/movie_poster_rm.dart';
import 'package:viemo/kinopoisk_api/src/models/response/movie_rating_rm.dart';

part 'movie_rm.g.dart';

@JsonSerializable(createToJson: false)
class MovieRM {
  const MovieRM({
    required this.id,
    required this.title,
    required this.rating,
    required this.duration,
    required this.type,
    required this.description,
    required this.year,
    required this.poster,
    required this.genres,
    required this.countries,
    required this.alternativeName,
  });

  final int id;
  @JsonKey(name: 'name')
  final String title;
  final RatingRM rating;
  @JsonKey(name: 'movieLength')
  final int duration;
  final String type;
  final String description;
  final int year;
  final PosterRM poster;
  final List<GenreRM> genres;
  final List<CountryRM> countries;
  final String alternativeName;

  static const fromJson = _$MovieRMFromJson;
}
