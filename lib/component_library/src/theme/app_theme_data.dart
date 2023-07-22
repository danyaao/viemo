import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:viemo/component_library/src/theme/app_colors.dart';
import 'package:viemo/component_library/src/theme/spacing.dart';

abstract class AppThemeData {
  ThemeData get materialThemeData;

  double screenMargin = Spacing.medium;

  TextStyle appTextStyle = GoogleFonts.montserrat();

  Color blue = AppColors.blue;
}

class LightAppThemeData extends AppThemeData {
  @override
  ThemeData get materialThemeData => ThemeData(
        brightness: Brightness.light,
      );
}

class DarkAppThemeData extends AppThemeData {
  @override
  ThemeData get materialThemeData => ThemeData(
        brightness: Brightness.dark,
      );
}
