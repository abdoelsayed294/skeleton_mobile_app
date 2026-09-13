import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';

class InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final bool isLast;

  const InfoRow({
    required this.icon,
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
                bottom: BorderSide(color: theme.dividerColor.withValues(alpha: 0.6)),
              ),
            ),
      child: Row(
        children: [
          Container(
            width: 30.w,
            height: 30.w,
            decoration: BoxDecoration(
              color: theme.primaryColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(icon, size: 15.sp, color: theme.primaryColor),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              label,
              style: isDark ? AppStyles.font12MediumDark : AppStyles.font12MediumLight,
            ),
          ),
          Text(
            value,
            style: isDark ? AppStyles.stockItemDark : AppStyles.stockItemLight,
          ),
        ],
      ),
    );
  }
}
