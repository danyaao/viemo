import 'package:equatable/equatable.dart';
import 'package:viemo/domain_models/src/movie.dart';

class MovieListPage extends Equatable {
  const MovieListPage({
    required this.movieList,
    required this.totalPages,
  });

  final List<Movie> movieList;
  final int totalPages;

  @override
  List<Object?> get props => [
        movieList,
        totalPages,
      ];
}
