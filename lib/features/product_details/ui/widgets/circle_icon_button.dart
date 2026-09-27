import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircleIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const CircleIconButton({super.key, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isLandscape =
        MediaQuery.orientationOf(context) == Orientation.landscape;
    final buttonSize = isLandscape ? 32.0 : 32.w;
    final iconSize = isLandscape ? 15.0 : 15.sp;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10.r),
      child: Container(
        width: buttonSize,
        height: buttonSize,
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: theme.dividerColor.withValues(alpha: 0.9)),
        ),
        child: Icon(
          icon,
          size: iconSize,
          color: theme.textTheme.bodyLarge?.color,
        ),
      ),
    );
  }
}
