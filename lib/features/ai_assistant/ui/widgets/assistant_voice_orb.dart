import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AssistantVoiceOrb extends StatelessWidget {
  final double size;
  const AssistantVoiceOrb({super.key, this.size = 112});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ringColor = theme.primaryColor.withValues(alpha: 0.16);
    return SizedBox(
      width: (size + 48).w,
      height: (size + 48).w,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: (size + 48).w,
            height: (size + 48).w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: ringColor),
            ),
          ),
          Container(
            width: (size + 26).w,
            height: (size + 26).w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: ringColor),
            ),
          ),
          Container(
            width: size.w,
            height: size.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [theme.primaryColor, theme.colorScheme.secondary],
              ),
              boxShadow: [
                BoxShadow(
                  color: theme.primaryColor.withValues(alpha: 0.25),
                  blurRadius: 24.r,
                  spreadRadius: 8.r,
                ),
              ],
            ),
            child: Icon(
              Icons.mic_none_rounded,
              color: Colors.white,
              size: (size * 0.43).sp,
            ),
          ),
        ],
      ),
    );
  }
}
