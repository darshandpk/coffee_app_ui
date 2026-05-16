import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_typography.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.kBackground,

    fontFamily: 'Poppins',

    textTheme: AppTypography.textTheme,

    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
    ),

    colorScheme: const ColorScheme.light(
      primary: AppColors.kPrimaryButton,
      secondary: AppColors.kCaramel,
      surface: AppColors.kCardBackground,
    ),
  );
}