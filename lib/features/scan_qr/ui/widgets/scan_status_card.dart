import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class ScanStatusCard extends StatelessWidget {
  const ScanStatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;
    final green = isDark ? AppColorsDark.success : AppColorsLight.success;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          Container(
            width: 9.w,
            height: 9.w,
            decoration: BoxDecoration(color: green, shape: BoxShape.circle),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              l10n.waitingForScan,
              style: (isDark ? AppStyles.txnIdDark : AppStyles.txnIdLight)
                  .copyWith(fontSize: 14.sp),
            ),
          ),
        ],
      ),
    );
  }
}
