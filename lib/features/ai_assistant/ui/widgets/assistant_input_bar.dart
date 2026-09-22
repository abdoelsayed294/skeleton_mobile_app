import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';

class AssistantInputBar extends StatelessWidget {
  final String hint;
  const AssistantInputBar({super.key, required this.hint});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Row(
        children: [
          Icon(
            Icons.edit_outlined,
            size: 13.sp,
            color: Theme.of(context).hintColor,
          ),
          SizedBox(width: 7.w),
          Expanded(
            child: Text(
              hint,
              style: isDark
                  ? AppStyles.assistantBodyDark
                  : AppStyles.assistantBodyLight,
            ),
          ),
          CircleAvatar(
            radius: 13.r,
            backgroundColor: Theme.of(context).primaryColor,
            child: Icon(
              Icons.arrow_upward_rounded,
              size: 15.sp,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
