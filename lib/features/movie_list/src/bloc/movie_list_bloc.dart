import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:viemo/movie_repository/movie_repository.dart';

import '../../../../domain_models/domain_models.dart';

part 'movie_list_event.dart';

part 'movie_list_state.dart';

class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  MovieListBloc({required MovieRepository movieRepository})
      : _movieRepository = movieRepository,
        super(const MovieListState()) {
    _registerEventHandler();
  }

  final MovieRepository _movieRepository;

  void _registerEventHandler() {
    on<MovieListEvent>(
      (event, emitter) async {
        if (event is MovieListSearchTermChanged) {
          await _handleMovieListSearchTermChanged(emitter, event);
        } else if (event is MovieListRefreshed) {
          await _handleMovieListRefreshed(emitter, event);
        } else if (event is MovieListNextPageRequested) {
          await _handleMovieListNextPageRequested(emitter, event);
        }
      },
      transformer: (eventStream, eventHandler) {
        final nonDebounceEventStream = eventStream.where(
          (event) => event is! MovieListSearchTermChanged,
        );

        final debounceEventStream =
            eventStream.whereType<MovieListSearchTermChanged>().debounceTime(
                  const Duration(seconds: 1),
                );
        final mergedEventStream = MergeStream(
          [
            nonDebounceEventStream,
            debounceEventStream,
          ],
        );
        final restartableTransformer = restartable<MovieListEvent>();
        return restartableTransformer(mergedEventStream, eventHandler);
      },
    );
  }

  Future<void> _handleMovieListSearchTermChanged(
    Emitter emitter,
    MovieListSearchTermChanged event,
  ) {
    emitter(MovieListState.loadingNewSearchTerm(searchTerm: event.searchTerm));

    final firstPageFetchStream = _fetchMoviePage(
      pageKey: 1,
      fetchPolicy: MovieListPageFetchPolicy.cachePreferably,
    );

    return emitter.onEach<MovieListState>(
      firstPageFetchStream,
      onData: emitter,
    );
  }

  Future<void> _handleMovieListRefreshed(
      Emitter emitter, MovieListRefreshed event) {
    final firstPageFetchStream = _fetchMoviePage(
      pageKey: 1,
      fetchPolicy: MovieListPageFetchPolicy.networkOnly,
      isRefresh: true,
    );

    return emitter.onEach<MovieListState>(
      firstPageFetchStream,
      onData: emitter,
    );
  }

  Future<void> _handleMovieListNextPageRequested(
      Emitter emitter, MovieListNextPageRequested event) {
    final nextPageFetchStream = _fetchMoviePage(
      pageKey: event.pageKey,
      fetchPolicy: MovieListPageFetchPolicy.networkPreferably,
    );

    return emitter.onEach<MovieListState>(
      nextPageFetchStream,
      onData: emitter,
    );
  }

  Stream<MovieListState> _fetchMoviePage({
    required int pageKey,
    required MovieListPageFetchPolicy fetchPolicy,
    bool isRefresh = false,
  }) async* {
    final currentlyAppliedFilter = state.filter;
    final pagesStream = _movieRepository.getMovieListPage(
        pageKey: pageKey,
        fetchPolicy: fetchPolicy,
        searchTerm: currentlyAppliedFilter is MovieListFilterBySearchTerm
            ? currentlyAppliedFilter.searchTerm
            : '');
    try {
      await for (final newPage in pagesStream) {
        final newItemList = newPage.movieList;
        final oldItemList = state.itemList ?? [];
        final completeItemList = isRefresh || pageKey == 1
            ? newItemList
            : (oldItemList + newItemList);
        final nextPage = newPage.totalPages == pageKey ? null : pageKey + 1;

        yield MovieListState.success(
          nextPage: nextPage,
          itemList: completeItemList,
          filter: currentlyAppliedFilter,
          isRefresh: isRefresh,
        );
      }
    } catch (error) {
      if (error is EmptySearchResultException) {
        yield MovieListState.noItemsFound(
          filter: currentlyAppliedFilter,
        );
      }

      if (isRefresh) {
        yield state.copyWithNewRefreshError(
          refreshError: error,
        );
      } else {
        yield state.copyWithNewError(
          error: error,
        );
      }
    }
  }
}
