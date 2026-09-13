import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';

class ProfitTile extends StatelessWidget {
  final String label;
  final String value;

  const ProfitTile({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final successColor = isDark ? AppColorsDark.success : AppColorsLight.success;
    final successBg = isDark ? AppColorsDark.successBg : AppColorsLight.successBg;
    final successBorder = isDark ? AppColorsDark.successBorder : AppColorsLight.successBorder;

    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: successBg,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: successBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: (isDark ? AppStyles.font12MediumDark : AppStyles.font12MediumLight)
                .copyWith(color: successColor),
          ),
          SizedBox(height: 8.h),
          Text(
            value,
            style: (isDark ? AppStyles.font18BoldDark : AppStyles.font18BoldLight)
                .copyWith(color: successColor),
          ),
        ],
      ),
    );
  }
}
