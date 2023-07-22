import 'package:json_annotation/json_annotation.dart';

import 'movie_rm.dart';

part 'movie_list_page_rm.g.dart';

@JsonSerializable(createToJson: false)
class MovieListPageRM {
  const MovieListPageRM({
    required this.movieList,
    required this.totalPages,
  });

  @JsonKey(name: 'docs')
  final List<MovieRM> movieList;
  @JsonKey(name: 'pages')
  final int totalPages;

  static const fromJson = _$MovieListPageRMFromJson;
}
