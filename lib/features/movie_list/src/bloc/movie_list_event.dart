part of 'movie_list_bloc.dart';

abstract class MovieListEvent extends Equatable {
  const MovieListEvent();
}

class MovieListSearchTermChanged extends MovieListEvent {
  const MovieListSearchTermChanged(
    this.searchTerm,
  );

  final String searchTerm;

  @override
  List<Object?> get props => [
        searchTerm,
      ];
}

class MovieListRefreshed extends MovieListEvent {
  const MovieListRefreshed();

  @override
  List<Object?> get props => [];
}

class MovieListNextPageRequested extends MovieListEvent {
  const MovieListNextPageRequested({
    required this.pageKey,
  });

  final int pageKey;

  @override
  List<Object?> get props => [
        pageKey,
      ];
}
