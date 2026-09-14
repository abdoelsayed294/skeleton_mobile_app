import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class AddPurchaseButton extends StatelessWidget {
  const AddPurchaseButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;
    return SizedBox(
      height: 48.h,
      child: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: isDark
            ? AppColorsDark.primary
            : AppColorsLight.primary,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.r),
        ),
        icon: Icon(
          Icons.add_rounded,
          color: isDark ? AppColorsDark.background : AppColorsLight.surface,
        ),
        label: Text(
          l10n.addPurchase,
          style: AppStyles.font14MediumLight.copyWith(
            color: isDark ? AppColorsDark.background : AppColorsLight.surface,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
