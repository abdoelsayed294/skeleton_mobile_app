import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';

class ProfileHeaderCard extends StatelessWidget {
  final String fullName;
  final String businessName;
  final String roleLabel;
  final String editLabel;
  final VoidCallback? onEdit;

  const ProfileHeaderCard({
    super.key,
    required this.fullName,
    required this.businessName,
    required this.roleLabel,
    required this.editLabel,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final surface = isDark ? AppColorsDark.surface : AppColorsLight.surface;
    final border = isDark ? AppColorsDark.border : AppColorsLight.border;
    final textPrimary = isDark
        ? AppColorsDark.textPrimary
        : AppColorsLight.textPrimary;
    final textSecondary = isDark
        ? AppColorsDark.textSecondary
        : AppColorsLight.textSecondary;
    final textMuted = isDark
        ? AppColorsDark.textMuted
        : AppColorsLight.textMuted;
    final avatarBg = isDark
        ? AppColorsDark.primary.withOpacity(0.12)
        : AppColorsLight.avatarBg;
    final primary = isDark ? AppColorsDark.primary : AppColorsLight.primary;

    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 14.h, 16.w, 14.h),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(color: border, width: 1.w),
      ),
      child: Row(
        children: [
          Container(
            width: 52.w,
            height: 52.w,
            decoration: BoxDecoration(
              color: avatarBg,
              shape: BoxShape.circle,
              border: Border.all(
                color: primary.withOpacity(isDark ? 0.3 : 1),
                width: 2.w,
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              fullName.split(' ').map((e) => e[0]).take(2).join(),
              style:
                  (isDark
                          ? AppStyles.font18BoldDark
                          : AppStyles.font18BoldLight)
                      .copyWith(
                        color: textPrimary,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                      ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        fullName,
                        style:
                            (isDark
                                    ? AppStyles.font18BoldDark
                                    : AppStyles.font18BoldLight)
                                .copyWith(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                      ),
                    ),
                    GestureDetector(
                      onTap: onEdit,
                      child: Text(
                        editLabel,
                        style:
                            (isDark
                                    ? AppStyles.font14MediumDark
                                    : AppStyles.font14MediumLight)
                                .copyWith(color: primary, fontSize: 14.sp),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
                Text(
                  businessName,
                  style:
                      (isDark
                              ? AppStyles.font14MediumDark
                              : AppStyles.font14MediumLight)
                          .copyWith(color: textSecondary, fontSize: 13.sp),
                ),
                SizedBox(height: 8.h),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: isDark
                        ? AppColorsDark.surface.withOpacity(0.8)
                        : AppColorsLight.borderLight,
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: border, width: 1.w),
                  ),
                  child: Text(
                    roleLabel,
                    style:
                        (isDark
                                ? AppStyles.font12MediumDark
                                : AppStyles.font12MediumLight)
                            .copyWith(
                              color: textMuted,
                              letterSpacing: 0.7,
                              fontSize: 9.5.sp,
                              fontWeight: FontWeight.w700,
                            ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
