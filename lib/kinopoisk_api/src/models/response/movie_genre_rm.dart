import 'package:json_annotation/json_annotation.dart';

part 'movie_genre_rm.g.dart';

@JsonSerializable(createToJson: false)
class GenreRM {
  GenreRM({
    required this.name,
  });

  final String name;

  static const fromJson = _$GenreRMFromJson;
}
