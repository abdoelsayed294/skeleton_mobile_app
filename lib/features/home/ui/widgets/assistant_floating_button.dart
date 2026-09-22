import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/features/ai_assistant/ui/screens/assistant_screen.dart';

class AssistantFloatingButton extends StatelessWidget {
  const AssistantFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (_) => const AssistantScreen())),
            borderRadius: BorderRadius.circular(40.r),
            child: Container(
              width: 58.w,
              height: 58.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [theme.primaryColor, theme.colorScheme.secondary],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: theme.primaryColor.withValues(alpha: 0.32),
                    blurRadius: 14.r,
                    offset: Offset(0, 6.h),
                  ),
                ],
              ),
              child: Icon(
                Icons.mic_none_rounded,
                color: Colors.white,
                size: 30.sp,
              ),
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(0, -7.h),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 2.h),
            decoration: BoxDecoration(
              color: theme.brightness == Brightness.dark
                  ? Colors.white
                  : const Color(0xFF0F2942),
              borderRadius: BorderRadius.circular(9.r),
              border: Border.all(color: theme.cardColor, width: 1.2.w),
            ),
            child: Text(
              'ASK',
              style: AppStyles.font12MediumLight.copyWith(
                color: theme.brightness == Brightness.dark
                    ? const Color(0xFF0F2942)
                    : Colors.white,
                fontSize: 8.sp,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
