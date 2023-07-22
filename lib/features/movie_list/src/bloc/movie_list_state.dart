part of 'movie_list_bloc.dart';

class MovieListState extends Equatable {
  const MovieListState({
    this.itemList,
    this.nextPage,
    this.filter,
    this.error,
    this.refreshError,
  });

  final List<Movie>? itemList;
  final int? nextPage;
  final MovieListFilter? filter;
  final dynamic error;
  final dynamic refreshError;

  MovieListState.loadingNewSearchTerm({
    required String searchTerm,
  }) : this(
          filter: searchTerm.isEmpty
              ? null
              : MovieListFilterBySearchTerm(searchTerm: searchTerm),
        );

  const MovieListState.success({
    required int? nextPage,
    required List<Movie> itemList,
    required MovieListFilter? filter,
    required bool isRefresh,
  }) : this(
          nextPage: nextPage,
          itemList: itemList,
          filter: filter,
        );

  const MovieListState.noItemsFound({
    required MovieListFilter? filter,
  }) : this(
          itemList: const [],
          error: null,
          nextPage: 1,
          filter: filter,
        );

  MovieListState copyWithNewError({
    required dynamic error,
  }) =>
      MovieListState(
        itemList: itemList,
        nextPage: nextPage,
        error: error,
        filter: filter,
        refreshError: null,
      );

  MovieListState copyWithNewRefreshError({
    required dynamic refreshError,
  }) =>
      MovieListState(
        itemList: itemList,
        nextPage: nextPage,
        error: error,
        filter: filter,
        refreshError: refreshError,
      );

  @override
  List<Object?> get props => [
        itemList,
        nextPage,
        filter,
        error,
        refreshError,
      ];
}

class MovieListFilter extends Equatable {
  const MovieListFilter();

  @override
  List<Object?> get props => [];
}

class MovieListFilterBySearchTerm extends MovieListFilter {
  const MovieListFilterBySearchTerm({
    required this.searchTerm,
  });

  final String searchTerm;

  @override
  List<Object?> get props => [
        searchTerm,
      ];
}
