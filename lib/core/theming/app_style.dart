import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_color.dart';

class AppStyles {
  AppStyles._();

  // ------- Light mode -------
  static TextStyle font24BoldLight = GoogleFonts.plusJakartaSans(
    fontSize: 24,
    fontWeight: FontWeight.w800,
    color: AppColorsLight.textPrimary,
  );

  static TextStyle font18BoldLight = GoogleFonts.plusJakartaSans(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColorsLight.textPrimary,
  );

  static TextStyle font16BoldLight = GoogleFonts.plusJakartaSans(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColorsLight.textPrimary,
  );

  static TextStyle font14MediumLight = GoogleFonts.plusJakartaSans(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColorsLight.textPrimary,
  );

  static TextStyle font12MediumLight = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColorsLight.textSecondary,
  );

  // ------- Dark mode -------
  static TextStyle font24BoldDark = GoogleFonts.plusJakartaSans(
    fontSize: 24,
    fontWeight: FontWeight.w800,
    color: AppColorsDark.textPrimary,
  );

  static TextStyle font18BoldDark = GoogleFonts.plusJakartaSans(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColorsDark.textPrimary,
  );

  static TextStyle font16BoldDark = GoogleFonts.plusJakartaSans(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColorsDark.textPrimary,
  );

  static TextStyle font14MediumDark = GoogleFonts.plusJakartaSans(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColorsDark.textPrimary,
  );

  static TextStyle font12MediumDark = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColorsDark.textSecondary,
  );
}
