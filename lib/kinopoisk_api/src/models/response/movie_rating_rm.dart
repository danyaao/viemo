import 'package:json_annotation/json_annotation.dart';

part 'movie_rating_rm.g.dart';

@JsonSerializable(createToJson: false)
class RatingRM {
  RatingRM({
    required this.kpRating,
    required this.imdbRating,
  });

  @JsonKey(name: 'kp')
  final double kpRating;
  @JsonKey(name: 'imdb')
  final double imdbRating;

  static const fromJson = _$RatingRMFromJson;
}
