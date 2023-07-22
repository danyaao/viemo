class UrlBuilder {
  final String _baseUrl = 'https://api.kinopoisk.dev';

  static const selectFields =
      'id name movieLength type description year alternativeName rating.kp rating.imdb genres countries poster.url poster.previewUrl';

  String buildGetMovieListPageUrl({required int page, String searchTerm = ''}) {
    return '$_baseUrl/v1.3/movie?page=$page&name=$searchTerm&selectFields=$selectFields';
  }
}
