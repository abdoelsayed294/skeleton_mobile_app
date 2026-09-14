import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/routing/routes.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class NotificationAppBar extends StatelessWidget {
  const NotificationAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;
    final titleStyle = isDark
        ? AppStyles.font18BoldDark
        : AppStyles.font18BoldLight;
    final iconColor = isDark
        ? AppColorsDark.textPrimary
        : AppColorsLight.textPrimary;
    final primary = isDark ? AppColorsDark.primary : AppColorsLight.primary;

    return Row(
      children: [
        IconButton(
          onPressed: () => Navigator.of(context).pop(),
          padding: EdgeInsets.zero,
          constraints: BoxConstraints.tightFor(width: 32.w, height: 38.h),
          icon: Icon(Icons.arrow_back_rounded, color: iconColor, size: 22.sp),
        ),
        SizedBox(width: 8.w),
        Text(l10n.notificationsTitle, style: titleStyle),
        const Spacer(),
        Icon(Icons.more_vert_rounded, color: iconColor, size: 21.sp),
        SizedBox(width: 10.w),
        InkWell(
          onTap: () => Navigator.of(context).pushNamed(Routes.profileScreen),
          borderRadius: BorderRadius.circular(17.r),
          child: Ink(
            width: 34.w,
            height: 34.w,
            decoration: BoxDecoration(color: primary, shape: BoxShape.circle),
            child: Icon(
              Icons.person_outline_rounded,
              color: Colors.white,
              size: 19.sp,
            ),
          ),
        ),
      ],
    );
  }
}
