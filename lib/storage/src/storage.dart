import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:viemo/storage/src/models/dark_mode_preference_cm.dart';
import 'package:viemo/storage/src/models/movie_cm.dart';
import 'package:viemo/storage/src/models/movie_list_page_cm.dart';

class Storage {
  static const _movieListPagesBoxKey = 'movie_list_pages';
  static const _darkModePreferenceBoxKey = 'dark_mode_preference';

  Storage() : _hive = Hive {
    try {
      _hive
        ..registerAdapter(MovieCMAdapter())
        ..registerAdapter(MovieListPageCMAdapter())
        ..registerAdapter(DarkModePreferenceCMAdapter());
    } catch (_) {
      throw Exception('Storage already exists');
    }
  }

  final HiveInterface _hive;

  Future<Box<T>> _openHiveBox<T>({
    required String boxKey,
    required bool isTemporary,
  }) async {
    if (_hive.isBoxOpen(boxKey)) {
      return _hive.box(boxKey);
    } else {
      final directory = await (isTemporary
          ? getTemporaryDirectory()
          : getApplicationDocumentsDirectory());
      return _hive.openBox<T>(
        boxKey,
        path: directory.path,
      );
    }
  }

  Future<Box<MovieListPageCM>> get movieListPageBox => _openHiveBox(
        boxKey: _movieListPagesBoxKey,
        isTemporary: true,
      );

  Future<Box<DarkModePreferenceCM>> get darkModePreferenceBox => _openHiveBox(
        boxKey: _darkModePreferenceBoxKey,
        isTemporary: false,
      );
}
