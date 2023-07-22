import 'package:dio/dio.dart';
import 'package:viemo/kinopoisk_api/src/exceptions.dart';
import 'package:viemo/kinopoisk_api/src/models/response/movie_list_page_rm.dart';
import 'package:viemo/kinopoisk_api/src/url_builder.dart';

class KinopoiskApi {
  KinopoiskApi()
      : _dio = Dio(),
        _urlBuilder = UrlBuilder() {
    _dio.options.headers['X-API-KEY'] =
        const String.fromEnvironment('kinopoisk_api_key');
  }

  final Dio _dio;
  final UrlBuilder _urlBuilder;

  Future<MovieListPageRM> getMovieListPage({
    required int page,
    String searchTerm = '',
  }) async {
    final url = _urlBuilder.buildGetMovieListPageUrl(
      page: page,
      searchTerm: searchTerm,
    );
    final response = await _dio.get(url);
    final jsonObject = response.data;
    final movieListPage = MovieListPageRM.fromJson(jsonObject);
    final firstItem = movieListPage.movieList.first;
    if (firstItem.id == 0) {
      throw EmptySearchResultKinopoiskApiException();
    }
    return movieListPage;
  }
}
