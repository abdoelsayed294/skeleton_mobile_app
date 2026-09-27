import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/features/expeness/ui/widgets/expense_trend_line_painter.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

/// "Monthly Trend" card: a small line chart showing the expense flow
/// over the last few months, with month labels underneath.
class MonthlyTrendChartCard extends StatelessWidget {
  const MonthlyTrendChartCard({
    super.key,
    required this.year,
    required this.months,
    required this.values,
    required this.lastValueLabel,
  });

  final String year;
  final List<String> months;
  final List<double> values;
  final String lastValueLabel;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;
    final accent = isDark ? AppColorsDark.primary : AppColorsLight.primary;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(18.w),
      decoration: BoxDecoration(
        color: isDark ? AppColorsDark.surface : AppColorsLight.surface,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: isDark ? AppColorsDark.border : AppColorsLight.border,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.monthlyTrend,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: isDark
                          ? AppColorsDark.textPrimary
                          : AppColorsLight.textPrimary,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    l10n.monthlyTrendSubtitle,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                      color: isDark
                          ? AppColorsDark.textSecondary
                          : AppColorsLight.textSecondary,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: isDark ? AppColorsDark.border : AppColorsLight.infoBg,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  year,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w700,
                    color: accent,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          SizedBox(
            height: 110.h,
            width: double.infinity,
            child: CustomPaint(
              painter: ExpenseTrendLinePainter(
                values: values,
                lineColor: accent,
                gridColor: isDark
                    ? AppColorsDark.border
                    : AppColorsLight.border,
                lastValueLabel: lastValueLabel,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(months.length, (index) {
              final isLast = index == months.length - 1;
              return Text(
                months[index],
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 9.sp,
                  fontWeight: FontWeight.w600,
                  color: isLast
                      ? accent
                      : (isDark
                            ? AppColorsDark.textMuted
                            : AppColorsLight.textMuted),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
