import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/features/product_details/ui/widgets/activity_row.dart';

class ActivityEntry {
  final IconData icon;
  final Color color;
  final String title;
  final String subtitle;
  final String value;
  final String time;

  const ActivityEntry({
    required this.icon,
    required this.color,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.time,
  });
}

class ProductActivitySection extends StatelessWidget {
  final List<ActivityEntry> entries;
  final VoidCallback? onViewAll;

  const ProductActivitySection({super.key, required this.entries, this.onViewAll});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'RECENT ACTIVITY',
              style: isDark ? AppStyles.statTitleDark : AppStyles.statTitleLight,
            ),
            const Spacer(),
            GestureDetector(
              onTap: onViewAll,
              child: Text(
                'View All',
                style: (isDark ? AppStyles.font12MediumDark : AppStyles.font12MediumLight)
                    .copyWith(color: theme.primaryColor, fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Column(
          children: List.generate(entries.length, (index) {
            return Padding(
              padding: EdgeInsets.only(bottom: index == entries.length - 1 ? 0 : 10.h),
              child: ActivityRow(entry: entries[index]),
            );
          }),
        ),
      ],
    );
  }
}

