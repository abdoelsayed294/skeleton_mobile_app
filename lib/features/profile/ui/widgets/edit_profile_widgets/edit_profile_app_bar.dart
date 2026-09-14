import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class EditProfileAppBar extends StatelessWidget {
  const EditProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;
    final color = isDark
        ? AppColorsDark.textPrimary
        : AppColorsLight.textPrimary;
    return Row(
      children: [
        IconButton(
          onPressed: () => Navigator.of(context).maybePop(),
          icon: Icon(Icons.arrow_back_rounded, color: color, size: 23.sp),
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(minWidth: 32.w, minHeight: 32.w),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Text(
            l10n.editProfile,
            style:
                (isDark ? AppStyles.font18BoldDark : AppStyles.font18BoldLight)
                    .copyWith(fontSize: 18.sp),
          ),
        ),
        Icon(
          Icons.more_vert_rounded,
          color: isDark
              ? AppColorsDark.textSecondary
              : AppColorsLight.textSecondary,
          size: 22.sp,
        ),
        SizedBox(width: 12.w),
        CircleAvatar(
          radius: 17.r,
          backgroundColor: isDark
              ? AppColorsDark.primary
              : AppColorsLight.primary,
          child: Icon(
            Icons.person_outline_rounded,
            color: isDark ? AppColorsDark.background : Colors.white,
            size: 19.sp,
          ),
        ),
      ],
    );
  }
}
