import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final surface = isDark ? AppColorsDark.surface : AppColorsLight.surface;
    final border = isDark ? AppColorsDark.border : AppColorsLight.border;
    final textPrimary = isDark
        ? AppColorsDark.textPrimary
        : AppColorsLight.textPrimary;
    final primary = isDark ? AppColorsDark.primary : AppColorsLight.primary;
    final l10n = AppLocalizations.of(context)!;

    return Row(
      children: [
        Expanded(
          child: Text(
            l10n.profile,
            style:
                (isDark ? AppStyles.font24BoldDark : AppStyles.font24BoldLight)
                    .copyWith(fontSize: 24.sp, height: 1.2),
          ),
        ),
        Container(
          width: 36.w,
          height: 36.w,
          decoration: BoxDecoration(
            color: surface,
            borderRadius: BorderRadius.circular(18.r),
            border: Border.all(color: border, width: 1.w),
            boxShadow: [
              BoxShadow(
                color: primary.withValues(alpha: 0.08),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Icon(
            Icons.notifications_none_rounded,
            color: textPrimary,
            size: 20.sp,
          ),
        ),
      ],
    );
  }
}
