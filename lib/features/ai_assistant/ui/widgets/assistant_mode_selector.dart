import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';

class AssistantModeSelector extends StatelessWidget {
  final List<String> labels;
  const AssistantModeSelector({super.key, required this.labels});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bodyStyle = isDark
        ? AppStyles.assistantBodyDark
        : AppStyles.assistantBodyLight;
    return Container(
      padding: EdgeInsets.all(2.w),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          labels.length,
          (index) => Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
            decoration: BoxDecoration(
              color: index == 0
                  ? Theme.of(context).primaryColor.withValues(alpha: 0.13)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Text(
              labels[index],
              style: bodyStyle.copyWith(
                color: index == 0
                    ? Theme.of(context).primaryColor
                    : bodyStyle.color,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
