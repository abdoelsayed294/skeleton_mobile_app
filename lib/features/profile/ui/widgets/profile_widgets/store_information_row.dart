import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';

class StoreInformationRow extends StatelessWidget {
  final IconData icon;
  final Color iconBackground;
  final Color iconColor;
  final String label;
  final String value;

  const StoreInformationRow({
    super.key,
    required this.icon,
    required this.iconBackground,
    required this.iconColor,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final surface = isDark ? AppColorsDark.surface : AppColorsLight.surface;
    final textPrimary = isDark
        ? AppColorsDark.textPrimary
        : AppColorsLight.textPrimary;
    final textSecondary = isDark
        ? AppColorsDark.textSecondary
        : AppColorsLight.textSecondary;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(color: surface),
      child: Row(
        children: [
          Container(
            width: 34.w,
            height: 34.w,
            decoration: BoxDecoration(
              color: iconBackground,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(icon, color: iconColor, size: 18.sp),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        label,
                        style:
                            (isDark
                                    ? AppStyles.font12MediumDark
                                    : AppStyles.font12MediumLight)
                                .copyWith(
                                  color: textSecondary,
                                  fontSize: 11.sp,
                                ),
                      ),
                      SizedBox(height: 1.h),
                      Text(
                        value,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:
                            (isDark
                                    ? AppStyles.font14MediumDark
                                    : AppStyles.font14MediumLight)
                                .copyWith(color: textPrimary, fontSize: 14.sp),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.chevron_right_rounded,
                  color: textSecondary,
                  size: 22.sp,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
