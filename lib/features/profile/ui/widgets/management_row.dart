import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';

class ManagementRow extends StatelessWidget {
  final IconData icon;
  final Color iconBg;
  final Color iconColor;
  final String title;
  final String count;

  const ManagementRow({
    super.key,
    required this.icon,
    required this.iconBg,
    required this.iconColor,
    required this.title,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final surface = isDark ? AppColorsDark.surface : AppColorsLight.surface;
    final border = isDark ? AppColorsDark.border : AppColorsLight.border;
    final textPrimary = isDark
        ? AppColorsDark.textPrimary
        : AppColorsLight.textPrimary;
    final textSecondary = isDark
        ? AppColorsDark.textSecondary
        : AppColorsLight.textSecondary;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: surface,
        border: Border(
          bottom: BorderSide(color: border, width: 1.w),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 34.w,
            height: 34.w,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Icon(icon, color: iconColor, size: 18.sp),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              title,
              style:
                  (isDark
                          ? AppStyles.font16BoldDark
                          : AppStyles.font16BoldLight)
                      .copyWith(fontSize: 16.sp, color: textPrimary),
            ),
          ),
          Row(
            children: [
              Container(
                width: 38.w,
                height: 26.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isDark
                      ? AppColorsDark.surface.withOpacity(0.9)
                      : AppColorsLight.borderLight,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  count,
                  style:
                      (isDark
                              ? AppStyles.font14MediumDark
                              : AppStyles.font14MediumLight)
                          .copyWith(color: textPrimary, fontSize: 13.sp),
                ),
              ),
              SizedBox(width: 8.w),
              Icon(
                Icons.chevron_right_rounded,
                color: textSecondary,
                size: 22.sp,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
