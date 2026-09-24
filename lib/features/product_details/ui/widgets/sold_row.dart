import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';

class SoldRow extends StatelessWidget {
  final Color dotColor;
  final String label;
  final int value;
  final bool isLast;

  const SoldRow({
    required this.dotColor,
    required this.label,
    required this.value,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 11.h),
      decoration: isLast
          ? null
          : BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: theme.dividerColor.withValues(alpha: 0.6),
                ),
              ),
            ),
      child: Row(
        children: [
          Container(
            width: 7.w,
            height: 7.w,
            decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              label,
              style: isDark
                  ? AppStyles.font12MediumDark
                  : AppStyles.font12MediumLight,
            ),
          ),
          Text(
            '$value',
            style: isDark ? AppStyles.stockItemDark : AppStyles.stockItemLight,
          ),
        ],
      ),
    );
  }
}
