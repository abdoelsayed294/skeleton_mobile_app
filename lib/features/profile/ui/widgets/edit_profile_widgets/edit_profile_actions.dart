import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class EditProfileActions extends StatelessWidget {
  const EditProfileActions({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;
    final primary = isDark ? AppColorsDark.primary : AppColorsLight.primary;
    final onPrimary = isDark ? AppColorsDark.background : Colors.white;
    final mutedFill = isDark ? AppColorsDark.surface : AppColorsLight.infoBg;
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 46.h,
          child: ElevatedButton.icon(
            onPressed: () => Navigator.of(context).maybePop(),
            icon: Icon(
              Icons.check_circle_outline_rounded,
              color: onPrimary,
              size: 18.sp,
            ),
            label: Text(
              l10n.saveChanges,
              style: AppStyles.font14MediumLight.copyWith(
                color: onPrimary,
                fontWeight: FontWeight.w700,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: primary,
              elevation: isDark ? 8 : 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),
        ),
        SizedBox(height: 10.h),
        SizedBox(
          width: double.infinity,
          height: 44.h,
          child: TextButton(
            onPressed: () => Navigator.of(context).maybePop(),
            style: TextButton.styleFrom(
              backgroundColor: mutedFill,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            child: Text(
              l10n.cancel,
              style:
                  (isDark
                          ? AppStyles.font14MediumDark
                          : AppStyles.font14MediumLight)
                      .copyWith(color: primary, fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ],
    );
  }
}
