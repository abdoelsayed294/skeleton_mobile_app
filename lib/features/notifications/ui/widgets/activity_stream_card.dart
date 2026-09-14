import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class ActivityStreamCard extends StatelessWidget {
  final int unreadCount;

  const ActivityStreamCard({super.key, required this.unreadCount});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;
    final surface = isDark ? AppColorsDark.surface : AppColorsLight.surface;
    final border = isDark ? AppColorsDark.border : AppColorsLight.border;
    final primary = isDark ? AppColorsDark.primary : AppColorsLight.primary;
    final titleStyle = isDark
        ? AppStyles.font14MediumDark
        : AppStyles.font14MediumLight;
    final bodyStyle = isDark
        ? AppStyles.font12MediumDark
        : AppStyles.font12MediumLight;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: border),
      ),
      child: Row(
        children: [
          Container(
            width: 36.w,
            height: 36.w,
            decoration: BoxDecoration(
              color: primary.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.notifications_none_rounded,
              color: primary,
              size: 20.sp,
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.activityStream,
                  style: titleStyle.copyWith(fontWeight: FontWeight.w700),
                ),
                Text(
                  '$unreadCount ${l10n.unreadUpdates} ${l10n.todaySmall}',
                  style: bodyStyle.copyWith(fontSize: 10.sp),
                ),
              ],
            ),
          ),
          TextButton.icon(
            onPressed: () {},
            icon: Icon(Icons.done_all_rounded, size: 15.sp),
            label: Text(l10n.readAll),
            style: TextButton.styleFrom(
              foregroundColor: primary,
              backgroundColor: primary.withValues(alpha: 0.08),
              padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 9.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9.r),
              ),
              textStyle: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(width: 5.w),
          Container(
            width: 34.w,
            height: 34.w,
            decoration: BoxDecoration(
              color: primary.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(9.r),
            ),
            child: Icon(Icons.tune_rounded, color: primary, size: 17.sp),
          ),
        ],
      ),
    );
  }
}
