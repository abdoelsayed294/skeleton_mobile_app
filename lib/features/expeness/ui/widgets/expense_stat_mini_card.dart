import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';

/// One of the two small cards ("Highest Single" / "Lowest Single")
/// shown side by side below the hero card.
class ExpenseStatMiniCard extends StatelessWidget {
  const ExpenseStatMiniCard({
    super.key,
    required this.icon,
    required this.iconBg,
    required this.valueColor,
    required this.amount,
    required this.label,
    required this.subtitle,
  });

  final IconData icon;
  final Color iconBg;
  final Color valueColor;
  final double amount;
  final String label;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: isDark ? AppColorsDark.surface : AppColorsLight.surface,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isDark ? AppColorsDark.border : AppColorsLight.border,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 34.w,
              height: 34.w,
              decoration: BoxDecoration(
                color: iconBg,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(icon, size: 20.sp, color: valueColor),
            ),
            SizedBox(height: 10.h),
            Text(
              amount.toStringAsFixed(0),
              style: GoogleFonts.jetBrainsMono(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: valueColor,
                letterSpacing: -0.5,
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              label,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 11.sp,
                fontWeight: FontWeight.w400,
                color: isDark
                    ? AppColorsDark.textSecondary
                    : AppColorsLight.textSecondary,
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              subtitle,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
                color: isDark
                    ? AppColorsDark.textSecondary
                    : AppColorsLight.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
