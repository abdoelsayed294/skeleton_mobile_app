import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';

class PurchasesCountBadge extends StatelessWidget {
  final int count;

  const PurchasesCountBadge({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 3.h),
      decoration: BoxDecoration(
        color: isDark
            ? AppColorsDark.primary.withValues(alpha: .12)
            : AppColorsLight.avatarBg,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Text(
        count.toString(),
        style: (isDark ? AppStyles.statChangeDark : AppStyles.statChangeLight)
            .copyWith(
              color: isDark ? AppColorsDark.primary : AppColorsLight.primary,
            ),
      ),
    );
  }
}
