import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class NotificationPreferencesCard extends StatelessWidget {
  const NotificationPreferencesCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;
    final primary = isDark ? AppColorsDark.primary : AppColorsLight.primary;
    final surface = isDark ? AppColorsDark.surface : AppColorsLight.surface;
    final border = isDark ? AppColorsDark.border : AppColorsLight.border;
    final titleStyle = isDark
        ? AppStyles.font14MediumDark
        : AppStyles.font14MediumLight;
    final bodyStyle = isDark
        ? AppStyles.font12MediumDark
        : AppStyles.font12MediumLight;
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: border),
      ),
      child: Row(
        children: [
          Container(
            width: 42.w,
            height: 42.w,
            decoration: BoxDecoration(
              color: primary.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(11.r),
            ),
            child: Icon(
              Icons.manage_accounts_outlined,
              color: primary,
              size: 22.sp,
            ),
          ),
          SizedBox(width: 11.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.notificationPreferences,
                  style: titleStyle.copyWith(fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 2.h),
                Text(
                  l10n.notificationPreferencesBody,
                  style: bodyStyle.copyWith(fontSize: 10.sp),
                ),
              ],
            ),
          ),
          Icon(
            Icons.chevron_right_rounded,
            color: bodyStyle.color,
            size: 21.sp,
          ),
        ],
      ),
    );
  }
}
