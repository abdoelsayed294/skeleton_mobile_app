import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/features/product_details/ui/widgets/product_activity_section.dart';

class ActivityRow extends StatelessWidget {
  final ActivityEntry entry;
  final bool isLast;

  const ActivityRow({required this.entry, required this.isLast});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      decoration: isLast
          ? null
          : BoxDecoration(
              border: Border(
                bottom: BorderSide(color: theme.dividerColor.withValues(alpha: 0.6)),
              ),
            ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 34.w,
            height: 34.w,
            decoration: BoxDecoration(
              color: entry.color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Icon(entry.icon, size: 16.sp, color: entry.color),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entry.title,
                  style: isDark ? AppStyles.stockItemDark : AppStyles.stockItemLight,
                ),
                SizedBox(height: 2.h),
                Text(
                  entry.subtitle,
                  style: isDark ? AppStyles.font12MediumDark : AppStyles.font12MediumLight,
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                entry.value,
                style: (isDark ? AppStyles.stockItemDark : AppStyles.stockItemLight)
                    .copyWith(color: entry.color),
              ),
              SizedBox(height: 2.h),
              Text(
                entry.time,
                style: isDark ? AppStyles.font12MediumDark : AppStyles.font12MediumLight,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
