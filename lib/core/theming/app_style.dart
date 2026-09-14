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
    fontSize: 12,
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
    fontSize: 8,
    fontWeight: FontWeight.w500,
    color: AppColorsDark.textMuted,
  );

  static TextStyle productTitleDark = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: AppColorsDark.textPrimary,
  );

  static TextStyle productSubtitleDark = GoogleFonts.plusJakartaSans(
    fontSize: 8,
    fontWeight: FontWeight.w500,
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

  // ------- Reports screen (Light) -------
  static TextStyle reportsHeaderTitleLight = GoogleFonts.plusJakartaSans(
    fontSize: 18,
    fontWeight: FontWeight.w800,
    color: AppColorsLight.textPrimary,
  );

  static TextStyle monthNavLabelLight = GoogleFonts.plusJakartaSans(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColorsLight.textPrimary,
  );

  static TextStyle monthNavBadgeLight = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  static TextStyle totalSalesLabelLight = GoogleFonts.plusJakartaSans(
    fontSize: 11,
    fontWeight: FontWeight.w700,
    color: Colors.white.withValues(alpha: 0.64),
    letterSpacing: 0.6,
  );

  static TextStyle totalSalesAmountLight = GoogleFonts.syne(
    fontSize: 28,
    fontWeight: FontWeight.w800,
    color: Colors.white,
  );

  static TextStyle totalSalesUnitLight = GoogleFonts.plusJakartaSans(
    fontSize: 13,
    fontWeight: FontWeight.w700,
    color: Colors.white.withValues(alpha: 0.7),
  );

  static TextStyle totalSalesChangeLight = GoogleFonts.plusJakartaSans(
    fontSize: 11,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  static TextStyle totalSalesCompareLight = GoogleFonts.plusJakartaSans(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    color: Colors.white.withValues(alpha: 0.6),
  );

  static TextStyle totalSalesStatLabelLight = GoogleFonts.plusJakartaSans(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: Colors.white.withValues(alpha: 0.55),
  );

  static TextStyle totalSalesStatValueLight = GoogleFonts.plusJakartaSans(
    fontSize: 14,
    fontWeight: FontWeight.w800,
    color: Colors.white,
  );

  static TextStyle chartPeakBubbleLight = GoogleFonts.plusJakartaSans(
    fontSize: 11,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  static TextStyle salesBreakdownBigNumberLight = GoogleFonts.syne(
    fontSize: 22,
    fontWeight: FontWeight.w800,
    color: AppColorsLight.textPrimary,
  );

  static TextStyle salesBreakdownBigLabelLight = GoogleFonts.plusJakartaSans(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    color: AppColorsLight.textSecondary,
  );

  static TextStyle paymentLegendLabelLight = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColorsLight.textPrimary,
  );

  static TextStyle paymentLegendPercentLight = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: AppColorsLight.textPrimary,
  );

  static TextStyle topProductRankLight = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: AppColorsLight.textMuted,
  );

  static TextStyle topProductPriceLight = GoogleFonts.syne(
    fontSize: 13,
    fontWeight: FontWeight.w800,
    color: AppColorsLight.textPrimary,
  );

  static TextStyle topProductChangeLight = GoogleFonts.plusJakartaSans(
    fontSize: 10,
    fontWeight: FontWeight.w700,
    color: AppColorsLight.success,
  );

  static TextStyle txnIdLight = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: AppColorsLight.textPrimary,
  );

  static TextStyle txnMetaLight = GoogleFonts.plusJakartaSans(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: AppColorsLight.textSecondary,
  );

  static TextStyle txnTagLight = GoogleFonts.plusJakartaSans(
    fontSize: 9,
    fontWeight: FontWeight.w700,
    color: AppColorsLight.textSecondary,
  );

  static TextStyle txnAmountLight = GoogleFonts.syne(
    fontSize: 13,
    fontWeight: FontWeight.w800,
    color: AppColorsLight.textPrimary,
  );

  static TextStyle exportPdfButtonTextLight = GoogleFonts.plusJakartaSans(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  static TextStyle lastSyncedLight = GoogleFonts.plusJakartaSans(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: AppColorsLight.textMuted,
  );

  // ------- Reports screen (Dark) -------
  static TextStyle reportsHeaderTitleDark = GoogleFonts.plusJakartaSans(
    fontSize: 18,
    fontWeight: FontWeight.w800,
    color: AppColorsDark.textPrimary,
  );

  static TextStyle monthNavLabelDark = GoogleFonts.plusJakartaSans(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColorsDark.textPrimary,
  );

  static TextStyle monthNavBadgeDark = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  static TextStyle totalSalesLabelDark = totalSalesLabelLight;
  static TextStyle totalSalesAmountDark = totalSalesAmountLight;
  static TextStyle totalSalesUnitDark = totalSalesUnitLight;
  static TextStyle totalSalesChangeDark = totalSalesChangeLight;
  static TextStyle totalSalesCompareDark = totalSalesCompareLight;
  static TextStyle totalSalesStatLabelDark = totalSalesStatLabelLight;
  static TextStyle totalSalesStatValueDark = totalSalesStatValueLight;
  static TextStyle chartPeakBubbleDark = chartPeakBubbleLight;

  static TextStyle salesBreakdownBigNumberDark = GoogleFonts.syne(
    fontSize: 22,
    fontWeight: FontWeight.w800,
    color: AppColorsDark.textPrimary,
  );

  static TextStyle salesBreakdownBigLabelDark = GoogleFonts.plusJakartaSans(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    color: AppColorsDark.textSecondary,
  );

  static TextStyle paymentLegendLabelDark = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColorsDark.textPrimary,
  );

  static TextStyle paymentLegendPercentDark = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: AppColorsDark.textPrimary,
  );

  static TextStyle topProductRankDark = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: AppColorsDark.textMuted,
  );

  static TextStyle topProductPriceDark = GoogleFonts.syne(
    fontSize: 13,
    fontWeight: FontWeight.w800,
    color: AppColorsDark.textPrimary,
  );

  static TextStyle topProductChangeDark = GoogleFonts.plusJakartaSans(
    fontSize: 10,
    fontWeight: FontWeight.w700,
    color: AppColorsDark.success,
  );

  static TextStyle txnIdDark = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: AppColorsDark.textPrimary,
  );

  static TextStyle txnMetaDark = GoogleFonts.plusJakartaSans(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: AppColorsDark.textSecondary,
  );

  static TextStyle txnTagDark = GoogleFonts.plusJakartaSans(
    fontSize: 9,
    fontWeight: FontWeight.w700,
    color: AppColorsDark.textSecondary,
  );

  static TextStyle txnAmountDark = GoogleFonts.syne(
    fontSize: 13,
    fontWeight: FontWeight.w800,
    color: AppColorsDark.textPrimary,
  );

  static TextStyle exportPdfButtonTextDark = GoogleFonts.plusJakartaSans(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  static TextStyle lastSyncedDark = GoogleFonts.plusJakartaSans(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: AppColorsDark.textMuted,
  );
}
