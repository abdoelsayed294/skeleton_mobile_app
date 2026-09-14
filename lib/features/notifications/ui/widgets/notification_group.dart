import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';

class NotificationGroup extends StatelessWidget {
  final String title;
  final String? countLabel;
  final String? dateLabel;
  final List<Widget> items;

  const NotificationGroup({
    super.key,
    required this.title,
    required this.items,
    this.countLabel,
    this.dateLabel,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final titleStyle = isDark
        ? AppStyles.font16BoldDark
        : AppStyles.font16BoldLight;
    final metaStyle = isDark
        ? AppStyles.font12MediumDark
        : AppStyles.font12MediumLight;
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Row(
              children: [
                Text(title, style: titleStyle),
                const Spacer(),
                Text(
                  dateLabel ?? countLabel ?? '',
                  style: metaStyle.copyWith(fontSize: 10.sp),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          ...items.map(
            (item) => Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: item,
            ),
          ),
        ],
      ),
    );
  }
}
