import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';

class NotificationFilterChip extends StatelessWidget {
  final String label;
  final String? count;
  final bool selected;
  final IconData? icon;

  const NotificationFilterChip({
    super.key,
    required this.label,
    required this.selected,
    this.count,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primary = isDark ? AppColorsDark.primary : AppColorsLight.primary;
    final text = isDark
        ? AppColorsDark.textPrimary
        : AppColorsLight.textPrimary;
    final border = isDark ? AppColorsDark.border : AppColorsLight.border;
    final style = isDark
        ? AppStyles.font12MediumDark
        : AppStyles.font12MediumLight;
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(18.r),
      child: Container(
        height: 34.h,
        padding: EdgeInsets.symmetric(horizontal: 13.w),
        decoration: BoxDecoration(
          color: selected
              ? primary
              : (isDark ? AppColorsDark.surface : AppColorsLight.surface),
          borderRadius: BorderRadius.circular(18.r),
          border: Border.all(color: selected ? primary : border),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 16.sp, color: selected ? Colors.white : primary),
              SizedBox(width: 6.w),
            ],
            Text(
              label,
              style: style.copyWith(color: selected ? Colors.white : text),
            ),
            if (count != null) ...[
              SizedBox(width: 8.w),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: selected
                      ? Colors.white.withValues(alpha: 0.2)
                      : primary.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Text(
                  count!,
                  style: style.copyWith(
                    color: selected ? Colors.white : primary,
                    fontSize: 10.sp,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
