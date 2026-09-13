import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';

class StatColumn extends StatelessWidget {
  final String label;
  final String value;
  final bool isDark;

  const StatColumn({
    required this.label,
    required this.value,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: isDark
              ? AppStyles.totalSalesStatLabelDark
              : AppStyles.totalSalesStatLabelLight,
        ),
        SizedBox(height: 4.h),
        Text(
          value,
          style: isDark
              ? AppStyles.totalSalesStatValueDark
              : AppStyles.totalSalesStatValueLight,
        ),
      ],
    );
  }
}
