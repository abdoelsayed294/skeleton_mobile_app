import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavArrow extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const NavArrow({required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: Padding(
        padding: EdgeInsets.all(4.w),
        child: Icon(icon, size: 20.sp, color: theme.textTheme.bodySmall?.color),
      ),
    );
  }
}
