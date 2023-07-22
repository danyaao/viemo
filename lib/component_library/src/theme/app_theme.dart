import 'package:flutter/material.dart';
import 'package:viemo/component_library/src/theme/app_theme_data.dart';

class AppTheme extends InheritedWidget {
  const AppTheme({
    required this.lightTheme,
    required this.darkTheme,
    super.key,
    required Widget child,
  }) : super(child: child);

  final AppThemeData lightTheme;
  final AppThemeData darkTheme;

  static AppThemeData of(BuildContext context) {
    final AppTheme? appTheme =
        context.dependOnInheritedWidgetOfExactType<AppTheme>();
    assert(appTheme != null, 'No AppTheme found in context');
    final currentBrightness = Theme.of(context).brightness;
    return currentBrightness == Brightness.dark
        ? appTheme!.darkTheme
        : appTheme!.lightTheme;
  }

  @override
  bool updateShouldNotify(AppTheme oldWidget) =>
      oldWidget.lightTheme != lightTheme || oldWidget.darkTheme != darkTheme;
}
