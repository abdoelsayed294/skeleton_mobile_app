import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';

class PurchasesCountBadge extends StatelessWidget {
  const PurchasesCountBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 3.h),
      decoration: BoxDecoration(
        color: AppColorsLight.avatarBg,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Text(
        '48',
        style: AppStyles.statChangeLight.copyWith(
          color: AppColorsLight.primary,
        ),
      ),
    );
  }
}
