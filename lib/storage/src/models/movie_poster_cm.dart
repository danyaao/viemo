import 'package:hive/hive.dart';

part 'movie_poster_cm.g.dart';

@HiveType(typeId: 3)
class PosterCM {
  PosterCM({
    required this.url,
    required this.previewUrl,
  });

  @HiveField(0)
  final String url;
  @HiveField(1)
  final String previewUrl;
}
