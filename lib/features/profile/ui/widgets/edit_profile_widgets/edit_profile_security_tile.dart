import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';

class EditProfileSecurityTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color fill;
  final Color border;
  final Color primary;
  final Color text;
  final Color muted;
  final IconData? trailing;
  final bool? isEnabled;
  final ValueChanged<bool>? onToggle;

  const EditProfileSecurityTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.fill,
    required this.border,
    required this.primary,
    required this.text,
    required this.muted,
    this.trailing,
    this.isEnabled,
    this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: fill,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: border),
      ),
      child: Row(
        children: [
          Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
              color: primary.withValues(alpha: .12),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: primary, size: 19.sp),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style:
                      (isDark
                              ? AppStyles.font14MediumDark
                              : AppStyles.font14MediumLight)
                          .copyWith(color: text, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 2.h),
                Text(
                  subtitle,
                  style:
                      (isDark
                              ? AppStyles.font12MediumDark
                              : AppStyles.font12MediumLight)
                          .copyWith(color: primary, fontSize: 10.sp),
                ),
              ],
            ),
          ),
          if (onToggle != null)
            Switch(
              value: isEnabled ?? false,
              onChanged: onToggle,
              activeThumbColor: primary,
            )
          else
            Icon(trailing, color: muted, size: 22.sp),
        ],
      ),
    );
  }
}
