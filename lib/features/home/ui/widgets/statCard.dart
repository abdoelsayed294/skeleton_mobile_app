import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final String unit;
  final String change;
  final IconData icon;
  final Color? accentColor;
  final bool isNegative;
  final bool isSelected;
  final VoidCallback? onTap;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.unit,
    required this.change,
    required this.icon,
    this.accentColor,
    this.isNegative = false,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final accent = isSelected
        ? theme.primaryColor
        : accentColor ?? theme.textTheme.bodyLarge?.color;
    final changeColor = isNegative
        ? (isDark ? AppColorsDark.error : AppColorsLight.error)
        : (isDark ? AppColorsDark.success : AppColorsLight.success);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        height: 128.h,
        padding: EdgeInsets.fromLTRB(13.w, 12.h, 13.w, 10.h),
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isSelected
                ? theme.primaryColor.withOpacity(0.45)
                : accentColor == null
                ? theme.dividerColor
                : accent!.withOpacity(0.25),
            width: isSelected ? 1.5.w : 1.w,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8.r,
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
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:
                        (isDark
                                ? AppStyles.statTitleDark
                                : AppStyles.statTitleLight)
                            .copyWith(
                              color: isSelected ? theme.primaryColor : null,
                            ),
                  ),
                ),
                Container(
                  width: 28.w,
                  height: 28.w,
                  decoration: BoxDecoration(
                    color: (accent ?? theme.primaryColor).withOpacity(0.08),
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(
                      color: (accent ?? theme.primaryColor).withOpacity(0.18),
                    ),
                  ),
                  child: Icon(
                    icon,
                    size: 15.sp,
                    color: accent ?? theme.primaryColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Text(
              value,
              style:
                  (isDark ? AppStyles.statValueDark : AppStyles.statValueLight)
                      .copyWith(color: accent),
            ),
            Text(
              unit,
              style: isDark ? AppStyles.statUnitDark : AppStyles.statUnitLight,
            ),
            const Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.h),
              decoration: BoxDecoration(
                color: changeColor.withOpacity(0.08),
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: changeColor.withOpacity(0.35)),
              ),
              child: Text(
                '${isNegative ? '↘' : '↗'} $change',
                style:
                    (isDark
                            ? AppStyles.statChangeDark
                            : AppStyles.statChangeLight)
                        .copyWith(color: changeColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
