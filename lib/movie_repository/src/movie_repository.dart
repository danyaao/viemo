import 'package:viemo/kinopoisk_api/kinopoisk_api.dart';
import 'package:viemo/movie_repository/src/mappers/mappers.dart';
import 'package:viemo/movie_repository/src/movie_local_storage.dart';
import 'package:viemo/storage/storage.dart';
import '../../domain_models/domain_models.dart';

class MovieRepository {
  MovieRepository({
    required this.kinopoiskApi,
    required Storage storage,
  }) : _movieLocalStorage = MovieLocalStorage(storage: storage);

  final KinopoiskApi kinopoiskApi;
  final MovieLocalStorage _movieLocalStorage;

  Stream<MovieListPage> getMovieListPage({
    required int pageKey,
    String searchTerm = '',
    required MovieListPageFetchPolicy fetchPolicy,
  }) async* {
    final isSearching = searchTerm.isNotEmpty;
    final isFetchPolicyNetworkOnly =
        fetchPolicy == MovieListPageFetchPolicy.networkOnly;
    final shouldSkipCacheLookup = isSearching || isFetchPolicyNetworkOnly;
    if (shouldSkipCacheLookup) {
      final freshPage = await _getMovieListPageFromNetwork(
        pageKey: pageKey,
        searchTerm: searchTerm,
      );

      yield freshPage;
    } else {
      final cachedPage = await _movieLocalStorage.getMovieListPage(
        pageKey: pageKey,
      );

      final isFetchPolicyCacheAndNetwork =
          fetchPolicy == MovieListPageFetchPolicy.cacheAndNetwork;

      final isFetchPolicyCachePreferably =
          fetchPolicy == MovieListPageFetchPolicy.cachePreferably;

      final shouldEmitCachedPageInAdvance =
          isFetchPolicyCachePreferably || isFetchPolicyCacheAndNetwork;

      if (shouldEmitCachedPageInAdvance && cachedPage != null) {
        yield cachedPage.toDomainModel();
        if (isFetchPolicyCachePreferably) {
          return;
        }
      }

      try {
        final freshPage = await _getMovieListPageFromNetwork(
          pageKey: pageKey,
        );

        yield freshPage;
      } catch (_) {
        final isFetchPolicyNetworkPreferably =
            fetchPolicy == MovieListPageFetchPolicy.networkPreferably;
        if (cachedPage != null && isFetchPolicyNetworkPreferably) {
          yield cachedPage.toDomainModel();
          return;
        }

        rethrow;
      }
    }
  }

  Future<MovieListPage> _getMovieListPageFromNetwork(
      {required int pageKey, String searchTerm = ''}) async {
    try {
      final apiPage = await kinopoiskApi.getMovieListPage(
        page: pageKey,
        searchTerm: searchTerm,
      );
      final isSearching = searchTerm.isNotEmpty;
      final shouldStoreOnCache = !isSearching;
      if (shouldStoreOnCache) {
        final cachePage = apiPage.toCacheModel();
        await _movieLocalStorage.upsertMovieListPage(
          pageKey: 1,
          movieListPageCM: cachePage,
        );
      }

      final domainPage = apiPage.toDomainModel();
      return domainPage;
    } on EmptySearchResultKinopoiskApiException catch (_) {
      throw EmptySearchResultException();
    }
  }
}

enum MovieListPageFetchPolicy {
  cacheAndNetwork,
  networkOnly,
  networkPreferably,
  cachePreferably,
}
