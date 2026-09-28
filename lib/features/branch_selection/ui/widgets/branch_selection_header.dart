import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class BranchSelectionHeader extends StatelessWidget {
  final VoidCallback onLogout;
  final bool isLoggingOut;

  const BranchSelectionHeader({
    super.key,
    required this.onLogout,
    this.isLoggingOut = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primary = isDark ? AppColorsDark.primary : AppColorsLight.primary;
    final secondary = isDark
        ? AppColorsDark.textSecondary
        : AppColorsLight.textSecondary;

    return Row(
      children: [
        Text(
          AppLocalizations.of(context)!.appName,
          style: TextStyle(
            color: primary,
            fontSize: 21.sp,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.4,
          ),
        ),
        const Spacer(),
        Text(
          AppLocalizations.of(context)!.branchSelectionStep,
          style: TextStyle(color: secondary, fontSize: 12.sp),
        ),
        SizedBox(width: 8.w),
        Tooltip(
          message: AppLocalizations.of(context)!.logout,
          child: IconButton(
            onPressed: isLoggingOut ? null : onLogout,
            icon: isLoggingOut
                ? SizedBox(
                    width: 18.w,
                    height: 18.w,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: primary,
                    ),
                  )
                : Icon(Icons.logout_rounded, size: 20.sp),
            style: IconButton.styleFrom(
              minimumSize: Size(42.w, 42.w),
              padding: EdgeInsets.zero,
              backgroundColor: Theme.of(context).cardColor,
              foregroundColor: primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
                side: BorderSide(color: Theme.of(context).dividerColor),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
