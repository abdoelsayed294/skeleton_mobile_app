import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';

class AssistantQuestionTile extends StatelessWidget {
  final String label;
  const AssistantQuestionTile({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: EdgeInsets.fromLTRB(18.w, 0, 18.w, 8.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Row(
        children: [
          Icon(
            Icons.auto_awesome_rounded,
            size: 15.sp,
            color: Theme.of(context).primaryColor,
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              label,
              style: isDark
                  ? AppStyles.assistantQuestionDark
                  : AppStyles.assistantQuestionLight,
            ),
          ),
          Icon(
            Icons.chevron_right_rounded,
            size: 18.sp,
            color: Theme.of(context).hintColor,
          ),
        ],
      ),
    );
  }
}
