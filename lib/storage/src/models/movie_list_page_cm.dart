import 'package:hive/hive.dart';
import 'package:viemo/storage/src/models/movie_cm.dart';

part 'movie_list_page_cm.g.dart';

@HiveType(typeId: 1)
class MovieListPageCM {
  const MovieListPageCM({
    required this.movieList,
    required this.totalPages,
  });

  @HiveField(0)
  final List<MovieCM> movieList;
  @HiveField(1)
  final int totalPages;
}
