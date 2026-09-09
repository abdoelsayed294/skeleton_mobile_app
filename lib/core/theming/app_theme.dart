import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_color.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme => ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: AppColorsLight.background,
        primaryColor: AppColorsLight.primary,
        colorScheme: ColorScheme.light(
          primary: AppColorsLight.primary,
          secondary: AppColorsLight.primaryGradientEnd,
          surface: AppColorsLight.surface,
          error: AppColorsLight.error,
        ),
        textTheme: GoogleFonts.plusJakartaSansTextTheme().apply(
          bodyColor: AppColorsLight.textPrimary,
          displayColor: AppColorsLight.textPrimary,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: AppColorsLight.background,
          foregroundColor: AppColorsLight.textPrimary,
          elevation: 0,
        ),
        cardColor: AppColorsLight.surface,
        dividerColor: AppColorsLight.border,
      );

  static ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColorsDark.background,
        primaryColor: AppColorsDark.primary,
        colorScheme: ColorScheme.dark(
          primary: AppColorsDark.primary,
          secondary: AppColorsDark.primaryAlt,
          surface: AppColorsDark.surface,
          error: AppColorsDark.error,
        ),
        textTheme: GoogleFonts.plusJakartaSansTextTheme(
          ThemeData(brightness: Brightness.dark).textTheme,
        ).apply(
          bodyColor: AppColorsDark.textPrimary,
          displayColor: AppColorsDark.textPrimary,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: AppColorsDark.background,
          foregroundColor: AppColorsDark.textPrimary,
          elevation: 0,
        ),
        cardColor: AppColorsDark.surface,
        dividerColor: AppColorsDark.border,
      );
}
