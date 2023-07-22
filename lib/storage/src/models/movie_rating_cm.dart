import 'package:hive/hive.dart';

part 'movie_rating_cm.g.dart';

@HiveType(typeId: 2)
class RatingCM {
  RatingCM({
    required this.kpRating,
    required this.imdbRating,
  });

  @HiveField(0)
  final double kpRating;
  @HiveField(1)
  final double imdbRating;
}
