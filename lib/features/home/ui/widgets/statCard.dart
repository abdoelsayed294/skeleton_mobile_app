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
    final isLandscape =
        MediaQuery.sizeOf(context).width > MediaQuery.sizeOf(context).height;
    double horizontal(double value) => isLandscape ? value : value.w;
    double vertical(double value) => isLandscape ? value : value.h;
    double compact(double value) => isLandscape ? value : value.r;
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
        height: vertical(128),
        padding: EdgeInsets.fromLTRB(
          horizontal(13),
          vertical(12),
          horizontal(13),
          vertical(10),
        ),
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isSelected
                ? theme.primaryColor.withOpacity(0.45)
                : accentColor == null
                ? theme.dividerColor
                : accent!.withOpacity(0.25),
            width: compact(isSelected ? 1.5 : 1),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8.r,
              offset: Offset(0, compact(3)),
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
                  width: compact(28),
                  height: compact(28),
                  decoration: BoxDecoration(
                    color: (accent ?? theme.primaryColor).withOpacity(0.08),
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(
                      color: (accent ?? theme.primaryColor).withOpacity(0.18),
                    ),
                  ),
                  child: Icon(
                    icon,
                    size: compact(15),
                    color: accent ?? theme.primaryColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: vertical(8)),
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
              padding: EdgeInsets.symmetric(
                horizontal: horizontal(7),
                vertical: vertical(3),
              ),
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
