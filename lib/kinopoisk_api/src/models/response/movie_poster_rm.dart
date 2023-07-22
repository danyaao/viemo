import 'package:json_annotation/json_annotation.dart';

part 'movie_poster_rm.g.dart';

@JsonSerializable(createToJson: false)
class PosterRM {
  PosterRM({
    required this.url,
    required this.previewUrl,
  });

  final String url;
  final String previewUrl;

  static const fromJson = _$PosterRMFromJson;
}
