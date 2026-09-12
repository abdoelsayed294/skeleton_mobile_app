import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/features/reports/ui/widgets/nav_arrow.dart';

class MonthNavigator extends StatelessWidget {
  final String monthLabel;
  final String periodBadgeLabel;
  final VoidCallback? onPrevious;
  final VoidCallback? onNext;

  const MonthNavigator({
    super.key,
    required this.monthLabel,
    required this.periodBadgeLabel,
    this.onPrevious,
    this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: theme.dividerColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.14 : 0.04),
            blurRadius: 8.r,
            offset: Offset(0, 3.h),
          ),
        ],
      ),
      child: Row(
        children: [
          NavArrow(icon: Icons.chevron_left_rounded, onTap: onPrevious),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.calendar_today_rounded,
                  size: 14.sp,
                  color: theme.textTheme.bodySmall?.color,
                ),
                SizedBox(width: 6.w),
                Text(
                  monthLabel,
                  style: isDark
                      ? AppStyles.monthNavLabelDark
                      : AppStyles.monthNavLabelLight,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            decoration: BoxDecoration(
              color: theme.primaryColor,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              periodBadgeLabel,
              style: isDark
                  ? AppStyles.monthNavBadgeDark
                  : AppStyles.monthNavBadgeLight,
            ),
          ),
          SizedBox(width: 4.w),
          NavArrow(icon: Icons.chevron_right_rounded, onTap: onNext),
        ],
      ),
    );
  }
}


