import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarAction extends StatelessWidget {
  final IconData icon;
  final String tooltip;
  final bool isAccent;
  final VoidCallback? onTap;

  const AppBarAction({
    super.key,
    required this.icon,
    required this.tooltip,
    this.isAccent = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final accent = theme.primaryColor;

    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(11.r),
        child: Container(
          width: 34.w,
          height: 34.w,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: isAccent
                  ? [accent.withValues(alpha: 0.14), theme.cardColor]
                  : [theme.cardColor, theme.cardColor.withValues(alpha: 0.86)],
            ),
            borderRadius: BorderRadius.circular(11.r),
            border: Border.all(
              color: isAccent
                  ? accent.withValues(alpha: 0.35)
                  : theme.dividerColor.withValues(alpha: 0.9),
              width: 1.w,
            ),
            boxShadow: [
              BoxShadow(
                color: accent.withValues(alpha: isAccent ? 0.12 : 0.06),
                blurRadius: 5.r,
                offset: Offset(0, 2.h),
              ),
            ],
          ),
          child: Icon(
            icon,
            size: 15.sp,
            color: isAccent ? accent : theme.canvasColor,
          ),
        ),
      ),
    );
  }
}
