import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';

class AssistantHoldToSpeak extends StatelessWidget {
  final String label;
  const AssistantHoldToSpeak({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(30.r),
            child: Container(
              width: 42.w,
              height: 42.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [theme.primaryColor, theme.colorScheme.secondary],
                ),
                boxShadow: [
                  BoxShadow(
                    color: theme.primaryColor.withValues(alpha: 0.24),
                    blurRadius: 10.r,
                    offset: Offset(0, 4.h),
                  ),
                ],
              ),
              child: Icon(
                Icons.mic_none_rounded,
                color: Colors.white,
                size: 21.sp,
              ),
            ),
          ),
        ),
        SizedBox(height: 3.h),
        Text(
          label.toUpperCase(),
          style: AppStyles.assistantBodyLight.copyWith(
            color: theme.primaryColor,
            fontSize: 7.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
