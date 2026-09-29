import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeleton/core/theming/app_color.dart';
import 'package:skeleton/features/expeness/ui/widgets/peak_spending_day.dart';
import 'package:skeleton/l10n/app_localizations.dart';

class PeakSpendingDaysCard extends StatelessWidget {
  const PeakSpendingDaysCard({super.key, required this.days});

  final List<PeakSpendingDay> days;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;
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
          Text(
            l10n.peakSpendingDays,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              color: isDark
                  ? AppColorsDark.textPrimary
                  : AppColorsLight.textPrimary,
            ),
          ),
          SizedBox(height: 16.h),
          for (final day in days) ...[
            Row(
              children: [
                SizedBox(
                  width: 52.w,
                  child: Text(
                    day.date,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 10.sp,
                      color: isDark
                          ? AppColorsDark.textSecondary
                          : AppColorsLight.textSecondary,
                    ),
                  ),
                ),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: LinearProgressIndicator(
                      value: day.progress.clamp(0, 1),
                      minHeight: 7.h,
                      backgroundColor: isDark
                          ? AppColorsDark.border
                          : AppColorsLight.border,
                      valueColor: AlwaysStoppedAnimation(day.gradientEnd),
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Text(
                  day.amount.toStringAsFixed(0),
                  style: GoogleFonts.jetBrainsMono(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w700,
                    color: day.amountColor,
                  ),
                ),
                SizedBox(width: 3.w),
                Text(
                  l10n.currencyEgp,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 8.sp,
                    color: isDark
                        ? AppColorsDark.textSecondary
                        : AppColorsLight.textSecondary,
                  ),
                ),
              ],
            ),
            if (day != days.last) SizedBox(height: 13.h),
          ],
        ],
      ),
    );
  }
}
