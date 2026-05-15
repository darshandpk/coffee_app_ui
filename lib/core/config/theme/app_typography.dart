import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTypography {
  AppTypography._();

  // ───────────────── FONT FAMILY ─────────────────

  static TextStyle _font({
    required double fontSize,
    required FontWeight fontWeight,
    double? letterSpacing,
    double? height,
    Color? color,
  }) {
    return GoogleFonts.poppins(
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      height: height,
      color: color ?? AppColors.kTextPrimary,
    );
  }

  // ───────────────── FONT SIZES ─────────────────

  static const double _xs = 10.0;
  static const double _sm = 12.0;
  static const double _md = 14.0;
  static const double _lg = 16.0;
  static const double _xl = 20.0;
  static const double _2xl = 24.0;
  static const double _3xl = 28.0;
  static const double _4xl = 36.0;
  static const double _5xl = 48.0;

  // ───────────────── DISPLAY ─────────────────
  // Splash / Hero Titles

  static TextStyle get displayLarge => _font(
    fontSize: _5xl,
    fontWeight: FontWeight.w700,
    letterSpacing: -1.5,
    height: 1.1,
    color: AppColors.kWhite,
  );

  static TextStyle get displayMedium => _font(
    fontSize: _4xl,
    fontWeight: FontWeight.w700,
    letterSpacing: -1,
    height: 1.15,
  );

  static TextStyle get displaySmall => _font(
    fontSize: _3xl,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.5,
    height: 1.2,
  );

  // ───────────────── HEADLINE ─────────────────
  // Screen titles

  static TextStyle get headlineLarge => _font(
    fontSize: 30,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.25,
    height: 1.3,
  );

  static TextStyle get headlineMedium => _font(
    fontSize: _2xl,
    fontWeight: FontWeight.w600,
    height: 1.35,
  );

  static TextStyle get headlineSmall => _font(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 1.4,
  );

  // ───────────────── TITLE ─────────────────
  // Product Titles

  static TextStyle get titleLarge => _font(
    fontSize: _lg,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.15,
    height: 1.4,
  );

  static TextStyle get titleMedium => _font(
    fontSize: _md,
    fontWeight: FontWeight.w500,
    color: AppColors.kTextSecondary,
    height: 1.45,
  );

  static TextStyle get titleSmall => _font(
    fontSize: _sm,
    fontWeight: FontWeight.w500,
    color: AppColors.kTextSecondary,
    height: 1.5,
  );

  // ───────────────── BODY ─────────────────
  // Descriptions

  static TextStyle get bodyLarge => _font(
    fontSize: _lg,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.3,
    height: 1.6,
  );

  static TextStyle get bodyMedium => _font(
    fontSize: _md,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    height: 1.6,
  );

  static TextStyle get bodySmall => _font(
    fontSize: _sm,
    fontWeight: FontWeight.w400,
    color: AppColors.kTextSecondary,
    height: 1.55,
  );

  // ───────────────── LABEL ─────────────────
  // Buttons / Chips / Prices

  static TextStyle get labelLarge => _font(
    fontSize: _md,
    fontWeight: FontWeight.w700,
    height: 1.4,
  );

  static TextStyle get labelMedium => _font(
    fontSize: _sm,
    fontWeight: FontWeight.w600,
    height: 1.4,
  );

  static TextStyle get labelSmall => _font(
    fontSize: _xs,
    fontWeight: FontWeight.w600,
    height: 1.4,
  );

  // ───────────────── CUSTOM COFFEE STYLES ─────────────────

  /// Product price
  static TextStyle get price => _font(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: AppColors.kDarkBrown,
  );

  /// Add to cart button
  static TextStyle get buttonText => _font(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.kWhite,
  );

  /// Coffee category chip
  static TextStyle get chipText => _font(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  /// Splash title
  static TextStyle get splashTitle => _font(
    fontSize: 36,
    fontWeight: FontWeight.w600,
    color: AppColors.kWhite,
    letterSpacing: -0.5,
    height: 1.1,
  );

  // ───────────────── TEXT THEME ─────────────────

  static TextTheme get textTheme => TextTheme(
    displayLarge: displayLarge,
    displayMedium: displayMedium,
    displaySmall: displaySmall,

    headlineLarge: headlineLarge,
    headlineMedium: headlineMedium,
    headlineSmall: headlineSmall,

    titleLarge: titleLarge,
    titleMedium: titleMedium,
    titleSmall: titleSmall,

    bodyLarge: bodyLarge,
    bodyMedium: bodyMedium,
    bodySmall: bodySmall,

    labelLarge: labelLarge,
    labelMedium: labelMedium,
    labelSmall: labelSmall,
  );
}

// class AppTypography {
//   AppTypography._();
//
//   static double _scale(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//
//     if (width < 360) return 0.90;
//     if (width < 420) return 1.0;
//     if (width < 600) return 1.08;
//
//     return 1.15;
//   }
//
//   static TextStyle _font(
//       BuildContext context, {
//         required double fontSize,
//         required FontWeight fontWeight,
//         double? letterSpacing,
//         double? height,
//         Color? color,
//       }) {
//     final scale = _scale(context);
//
//     return GoogleFonts.poppins(
//       fontSize: fontSize * scale,
//       fontWeight: fontWeight,
//       letterSpacing: letterSpacing,
//       height: height,
//       color: color ?? AppColors.kTextPrimary,
//     );
//   }
//
//   // ───────────────── SPLASH SCREEN ─────────────────
//
//   static TextStyle splashTitle(BuildContext context) => _font(
//     context,
//     fontSize: 36,
//     fontWeight: FontWeight.w600,
//     height: 1.1,
//     letterSpacing: -0.5,
//     color: AppColors.kWhite,
//   );
//
//   static TextStyle splashSubtitle(BuildContext context) => _font(
//     context,
//     fontSize: 14,
//     fontWeight: FontWeight.w400,
//     color: AppColors.kCream,
//   );
//
//   // ───────────────── HEADLINES ─────────────────
//
//   static TextStyle headlineLarge(BuildContext context) => _font(
//     context,
//     fontSize: 28,
//     fontWeight: FontWeight.w700,
//   );
//
//   static TextStyle headlineMedium(BuildContext context) => _font(
//     context,
//     fontSize: 22,
//     fontWeight: FontWeight.w600,
//   );
//
//   static TextStyle headlineSmall(BuildContext context) => _font(
//     context,
//     fontSize: 18,
//     fontWeight: FontWeight.w600,
//   );
//
//   // ───────────────── PRODUCT TITLES ─────────────────
//
//   static TextStyle productTitle(BuildContext context) => _font(
//     context,
//     fontSize: 16,
//     fontWeight: FontWeight.w600,
//   );
//
//   static TextStyle productSubtitle(BuildContext context) => _font(
//     context,
//     fontSize: 12,
//     fontWeight: FontWeight.w400,
//     color: AppColors.kTextSecondary,
//   );
//
//   // ───────────────── BODY ─────────────────
//
//   static TextStyle bodyLarge(BuildContext context) => _font(
//     context,
//     fontSize: 16,
//     fontWeight: FontWeight.w400,
//   );
//
//   static TextStyle bodyMedium(BuildContext context) => _font(
//     context,
//     fontSize: 14,
//     fontWeight: FontWeight.w400,
//   );
//
//   static TextStyle bodySmall(BuildContext context) => _font(
//     context,
//     fontSize: 12,
//     fontWeight: FontWeight.w400,
//     color: AppColors.kTextSecondary,
//   );
//
//   // ───────────────── BUTTON TEXT ─────────────────
//
//   static TextStyle buttonText(BuildContext context) => _font(
//     context,
//     fontSize: 14,
//     fontWeight: FontWeight.w600,
//     color: AppColors.kWhite,
//   );
//
//   // ───────────────── PRICE ─────────────────
//
//   static TextStyle price(BuildContext context) => _font(
//     context,
//     fontSize: 22,
//     fontWeight: FontWeight.w700,
//   );
//
//   // ───────────────── CHIP TEXT ─────────────────
//
//   static TextStyle chipText(BuildContext context) => _font(
//     context,
//     fontSize: 12,
//     fontWeight: FontWeight.w500,
//   );
// }