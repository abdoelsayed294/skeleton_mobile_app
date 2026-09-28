import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class BranchesEmptyState extends StatelessWidget {
  const BranchesEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.h),
      child: Center(
        child: Text(
          AppLocalizations.of(context)!.noBranchesAvailable,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isDark
                ? AppColorsDark.textSecondary
                : AppColorsLight.textSecondary,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }
}
