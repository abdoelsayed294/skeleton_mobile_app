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
  static TextStyle font24BlackLight = GoogleFonts.syne(
    fontSize: 24,
    fontWeight: FontWeight.w900,
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
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColorsLight.textSecondary,
  );

  static TextStyle statTitleLight = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: AppColorsLight.textSecondary,
  );

  static TextStyle statValueLight = GoogleFonts.syne(
    fontSize: 20,
    fontWeight: FontWeight.w800,
    color: AppColorsLight.textPrimary,
  );

  static TextStyle statUnitLight = GoogleFonts.plusJakartaSans(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: AppColorsLight.textSecondary,
  );

  static TextStyle statChangeLight = GoogleFonts.plusJakartaSans(
    fontSize: 9,
    fontWeight: FontWeight.w600,
    color: AppColorsLight.success,
  );

  static TextStyle salesOverviewTitleLight = GoogleFonts.plusJakartaSans(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColorsLight.textPrimary,
  );

  static TextStyle salesOverviewSubtitleLight = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColorsLight.textSecondary,
  );

  static TextStyle salesOverviewCurrencyLight = GoogleFonts.plusJakartaSans(
    fontSize: 9,
    fontWeight: FontWeight.w700,
    color: AppColorsLight.primary,
  );

  static TextStyle salesOverviewAmountLight = GoogleFonts.syne(
    fontSize: 20,
    fontWeight: FontWeight.w800,
    color: AppColorsLight.textPrimary,
  );

  static TextStyle salesOverviewPercentLight = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: AppColorsLight.success,
  );

  static TextStyle salesOverviewMetaLight = GoogleFonts.plusJakartaSans(
    fontSize: 7,
    fontWeight: FontWeight.w500,
    color: AppColorsLight.textSecondary,
  );

  static TextStyle salesOverviewFilterLight = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: AppColorsLight.textSecondary,
  );

  static TextStyle salesChartLabelLight = GoogleFonts.plusJakartaSans(
    fontSize: 8,
    fontWeight: FontWeight.w500,
    color: AppColorsLight.textMuted,
  );

  static TextStyle productTitleLight = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: AppColorsLight.textPrimary,
  );

  static TextStyle productSubtitleLight = GoogleFonts.plusJakartaSans(
    fontSize: 8,
    fontWeight: FontWeight.w500,
    color: AppColorsLight.textSecondary,
  );

  static TextStyle productPriceLight = GoogleFonts.syne(
    fontSize: 13,
    fontWeight: FontWeight.w800,
    color: AppColorsLight.primary,
  );

  static TextStyle stockTitleLight = GoogleFonts.syne(
    fontSize: 18,
    fontWeight: FontWeight.w900,
    color: AppColorsLight.textPrimary,
  );

  static TextStyle stockItemLight = GoogleFonts.plusJakartaSans(
    fontSize: 11,
    fontWeight: FontWeight.w700,
    color: AppColorsLight.textPrimary,
  );

  static TextStyle stockStatusLight = GoogleFonts.plusJakartaSans(
    fontSize: 11,
    fontWeight: FontWeight.w700,
    color: AppColorsLight.error,
  );

  static TextStyle stockBadgeLight = GoogleFonts.plusJakartaSans(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    color: AppColorsLight.error,
  );

  static TextStyle assistantTitleLight = GoogleFonts.plusJakartaSans(
    fontSize: 13,
    fontWeight: FontWeight.w800,
    color: AppColorsLight.textPrimary,
  );

  static TextStyle assistantHeadlineLight = GoogleFonts.plusJakartaSans(
    fontSize: 18,
    fontWeight: FontWeight.w800,
    color: AppColorsLight.textPrimary,
  );

  static TextStyle assistantBodyLight = GoogleFonts.plusJakartaSans(
    fontSize: 9,
    fontWeight: FontWeight.w500,
    color: AppColorsLight.textSecondary,
  );

  static TextStyle assistantQuestionLight = GoogleFonts.plusJakartaSans(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    color: AppColorsLight.textPrimary,
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

  static TextStyle statTitleDark = GoogleFonts.plusJakartaSans(
    fontSize: 11,
    fontWeight: FontWeight.w700,
    color: AppColorsDark.textSecondary,
  );

  static TextStyle statValueDark = GoogleFonts.syne(
    fontSize: 20,
    fontWeight: FontWeight.w800,
    color: AppColorsDark.textPrimary,
  );

  static TextStyle statUnitDark = GoogleFonts.plusJakartaSans(
    fontSize: 9,
    fontWeight: FontWeight.w500,
    color: AppColorsDark.textSecondary,
  );

  static TextStyle statChangeDark = GoogleFonts.plusJakartaSans(
    fontSize: 9,
    fontWeight: FontWeight.w600,
    color: AppColorsDark.success,
  );

  static TextStyle salesOverviewTitleDark = GoogleFonts.plusJakartaSans(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColorsDark.textPrimary,
  );

  static TextStyle salesOverviewSubtitleDark = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColorsDark.textSecondary,
  );

  static TextStyle salesOverviewAmountDark = GoogleFonts.syne(
    fontSize: 20,
    fontWeight: FontWeight.w800,
    color: AppColorsDark.textPrimary,
  );

  static TextStyle salesOverviewCurrencyDark = GoogleFonts.plusJakartaSans(
    fontSize: 9,
    fontWeight: FontWeight.w700,
    color: AppColorsDark.primary,
  );

  static TextStyle salesOverviewPercentDark = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: AppColorsDark.success,
  );

  static TextStyle salesOverviewMetaDark = GoogleFonts.plusJakartaSans(
    fontSize: 7,
    fontWeight: FontWeight.w500,
    color: AppColorsDark.textSecondary,
  );

  static TextStyle salesOverviewFilterDark = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: AppColorsDark.textSecondary,
  );

  static TextStyle salesChartLabelDark = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: AppColorsDark.textMuted,
  );

  static TextStyle productTitleDark = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: AppColorsDark.textPrimary,
  );

  static TextStyle productSubtitleDark = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: AppColorsDark.textSecondary,
  );

  static TextStyle productPriceDark = GoogleFonts.syne(
    fontSize: 13,
    fontWeight: FontWeight.w800,
    color: AppColorsDark.primary,
  );

  static TextStyle stockTitleDark = GoogleFonts.syne(
    fontSize: 18,
    fontWeight: FontWeight.w900,
    color: AppColorsDark.textPrimary,
  );

  static TextStyle stockItemDark = GoogleFonts.plusJakartaSans(
    fontSize: 11,
    fontWeight: FontWeight.w700,
    color: AppColorsDark.textPrimary,
  );

  static TextStyle stockStatusDark = GoogleFonts.plusJakartaSans(
    fontSize: 11,
    fontWeight: FontWeight.w700,
    color: AppColorsDark.error,
  );

  static TextStyle stockBadgeDark = GoogleFonts.plusJakartaSans(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    color: AppColorsDark.error,
  );

  static TextStyle assistantTitleDark = GoogleFonts.plusJakartaSans(
    fontSize: 13,
    fontWeight: FontWeight.w800,
    color: AppColorsDark.textPrimary,
  );

  static TextStyle assistantHeadlineDark = GoogleFonts.plusJakartaSans(
    fontSize: 18,
    fontWeight: FontWeight.w800,
    color: AppColorsDark.textPrimary,
  );

  static TextStyle assistantBodyDark = GoogleFonts.plusJakartaSans(
    fontSize: 9,
    fontWeight: FontWeight.w500,
    color: AppColorsDark.textSecondary,
  );

  static TextStyle assistantQuestionDark = GoogleFonts.plusJakartaSans(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    color: AppColorsDark.textPrimary,
  );
  static TextStyle font24BlackDark = GoogleFonts.syne(
    fontSize: 24,
    fontWeight: FontWeight.w900,
    color: AppColorsDark.textPrimary,
  );
}
