import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';

class EditProfileHeroStat extends StatelessWidget {
  final String label;
  final String value;
  final Color color;
  final Color muted;

  const EditProfileHeroStat({
    super.key,
    required this.label,
    required this.value,
    required this.color,
    required this.muted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      decoration: BoxDecoration(
        border: Border(right: BorderSide(color: muted.withValues(alpha: .25))),
      ),
      child: Column(
        children: [
          Text(
            label,
            textAlign: TextAlign.center,
            style: AppStyles.font12MediumLight.copyWith(
              color: muted,
              fontSize: 9.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 3.h),
          Text(
            value,
            textAlign: TextAlign.center,
            style: AppStyles.font12MediumLight.copyWith(
              color: color,
              fontSize: 11.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
