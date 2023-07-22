import 'package:viemo/storage/storage.dart';

class MovieLocalStorage {
  MovieLocalStorage({
    required this.storage,
  });

  final Storage storage;

  Future<void> upsertMovieListPage({
    required int pageKey,
    required MovieListPageCM movieListPageCM,
  }) async {
    final box = await storage.movieListPageBox;
    return box.put(
      pageKey,
      movieListPageCM,
    );
  }

  Future<void> clearMovieListPageBox() async {
    final box = await storage.movieListPageBox;
    await box.clear();
  }

  Future<MovieListPageCM?> getMovieListPage({
    required int pageKey,
  }) async {
    final box = await storage.movieListPageBox;
    return box.get(pageKey);
  }

  Future<MovieCM?> getMovie({
    required int id,
  }) async {
    final box = await storage.movieListPageBox;
    final completeMovieList =
        [...box.values].expand((element) => element.movieList);
    try {
      return completeMovieList.firstWhere((element) => element.id == id);
    } catch (_) {
      return null;
    }
  }
}
