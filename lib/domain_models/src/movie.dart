import 'package:equatable/equatable.dart';
import 'package:viemo/domain_models/src/movie_poster.dart';
import 'package:viemo/domain_models/src/movie_rating.dart';

class Movie extends Equatable {
  const Movie({
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
  final String title;
  final Rating rating;
  final int duration;
  final String type;
  final String description;
  final int year;
  final Poster poster;
  final List<String> genres;
  final List<String> countries;
  final String alternativeName;

  @override
  List<Object?> get props => [
        id,
        title,
        rating,
        duration,
        type,
        description,
        year,
        poster,
        genres,
        countries,
        alternativeName,
      ];
}
