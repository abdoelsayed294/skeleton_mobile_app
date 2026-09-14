import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';

class EditProfileSectionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<Widget> children;

  const EditProfileSectionCard({
    super.key,
    required this.title,
    required this.icon,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final surface = isDark ? AppColorsDark.surface : AppColorsLight.surface;
    final border = isDark ? AppColorsDark.border : AppColorsLight.border;
    final primary = isDark ? AppColorsDark.primary : AppColorsLight.primary;
    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 20.h, 16.w, 20.h),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: border),
        boxShadow: isDark
            ? const []
            : const [BoxShadow(color: Color(0x091E88E5), blurRadius: 8)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: primary, size: 20.sp),
              SizedBox(width: 8.w),
              Text(
                title,
                style:
                    (isDark
                            ? AppStyles.font16BoldDark
                            : AppStyles.font16BoldLight)
                        .copyWith(fontSize: 16.sp),
              ),
            ],
          ),
          SizedBox(height: 18.h),
          ...children,
        ],
      ),
    );
  }
}
