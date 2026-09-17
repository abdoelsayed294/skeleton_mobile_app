import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';

class ProfitMetricCard extends StatelessWidget {
  final String label;
  final String value;
  final String unit;
  final String change;
  final Color accentColor;
  final IconData icon;

  const ProfitMetricCard({
    super.key,
    required this.label,
    required this.value,
    required this.unit,
    required this.change,
    required this.accentColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Expanded(
      child: Container(
        height: 112.h,
        padding: EdgeInsets.fromLTRB(12.w, 11.h, 12.w, 9.h),
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(color: theme.dividerColor),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 7.r,
              offset: Offset(0, 3.h),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    label.toUpperCase(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: isDark
                        ? AppStyles.statTitleDark
                        : AppStyles.statTitleLight,
                  ),
                ),
                Icon(icon, size: 15.sp, color: accentColor),
              ],
            ),
            SizedBox(height: 8.h),
            Text(
              value,
              style: isDark
                  ? AppStyles.statValueDark
                  : AppStyles.statValueLight,
            ),
            Text(
              unit,
              style: isDark ? AppStyles.statUnitDark : AppStyles.statUnitLight,
            ),
            const Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: accentColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(7.r),
              ),
              child: Text(
                change,
                style:
                    (isDark
                            ? AppStyles.statChangeDark
                            : AppStyles.statChangeLight)
                        .copyWith(color: accentColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
