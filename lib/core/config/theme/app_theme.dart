import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.kBackground,
    fontFamily: 'Poppins',

    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
    ),

    colorScheme: ColorScheme.light(
      primary: AppColors.kPrimaryButton,
      secondary: AppColors.kCaramel,
      surface: AppColors.kCardBackground,
    ),
  );
}