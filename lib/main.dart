import 'dart:async';

import 'package:flutter/material.dart';
import 'package:viemo/component_library/component_library.dart';
import 'package:viemo/features/movie_list/movie_list.dart';
import 'package:viemo/kinopoisk_api/kinopoisk_api.dart';
import 'package:viemo/movie_repository/movie_repository.dart';
import 'package:viemo/storage/storage.dart';

void main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(
      const App(),
    );
  }, (error, stack) {});
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _storage = Storage();
  final _kinopoiskApi = KinopoiskApi();
  late final _movieRepository = MovieRepository(
    kinopoiskApi: _kinopoiskApi,
    storage: _storage,
  );

  final _lightTheme = LightAppThemeData();
  final _darkTheme = DarkAppThemeData();

  @override
  Widget build(BuildContext context) {
    return AppTheme(
      lightTheme: _lightTheme,
      darkTheme: _darkTheme,
      child: MaterialApp(
        theme: _lightTheme.materialThemeData,
        darkTheme: _darkTheme.materialThemeData,
        home: MovieListScreen(
          movieRepository: _movieRepository,
        ),
      ),
    );
  }
}
