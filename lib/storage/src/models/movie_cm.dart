import 'package:hive/hive.dart';
import 'package:viemo/storage/src/models/movie_poster_cm.dart';
import 'package:viemo/storage/src/models/movie_rating_cm.dart';

part 'movie_cm.g.dart';

@HiveType(typeId: 0)
class MovieCM {
  const MovieCM({
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

  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final RatingCM rating;
  @HiveField(3)
  final int duration;
  @HiveField(4)
  final String type;
  @HiveField(5)
  final String description;
  @HiveField(6)
  final int year;
  @HiveField(7)
  final PosterCM poster;
  @HiveField(8)
  final List<String> genres;
  @HiveField(9)
  final List<String> countries;
  @HiveField(10)
  final String alternativeName;
}
