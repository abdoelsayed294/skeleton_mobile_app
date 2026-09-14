import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';

class ProfileStatItem extends StatelessWidget {
  final String value;
  final String label;
  final bool isLast;

  const ProfileStatItem({
    super.key,
    required this.value,
    required this.label,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final border = isDark ? AppColorsDark.border : AppColorsLight.border;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(color: border, width: isLast ? 0 : 1.w),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: (isDark ? AppStyles.statValueDark : AppStyles.statValueLight)
                .copyWith(fontSize: 25.sp, height: 1.1),
          ),
          SizedBox(height: 4.h),
          Text(
            label.toUpperCase(),
            textAlign: TextAlign.center,
            style: (isDark ? AppStyles.statTitleDark : AppStyles.statTitleLight)
                .copyWith(fontSize: 9.sp, letterSpacing: 0.15),
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
