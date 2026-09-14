import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/features/profile/ui/widgets/profile_widgets/profile_stat_item.dart';

class ProfileStatData {
  final String value;
  final String label;

  const ProfileStatData({required this.value, required this.label});
}

class ProfileStatsGrid extends StatelessWidget {
  final List<ProfileStatData> items;

  const ProfileStatsGrid({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final surface = isDark ? AppColorsDark.surface : AppColorsLight.surface;
    final border = isDark ? AppColorsDark.border : AppColorsLight.border;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: border, width: 1.w),
      ),
      child: Row(
        children: List.generate(items.length, (index) {
          final item = items[index];
          return Expanded(
            child: ProfileStatItem(
              value: item.value,
              label: item.label,
              isLast: index == items.length - 1,
            ),
          );
        }),
      ),
    );
  }
}
