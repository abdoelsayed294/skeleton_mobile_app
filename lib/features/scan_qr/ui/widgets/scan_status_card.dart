import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class ScanStatusCard extends StatelessWidget {
  final Duration remaining;

  const ScanStatusCard({super.key, required this.remaining});

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
          Container(
            padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: isDark
                  ? AppColorsDark.primary.withValues(alpha: 0.12)
                  : AppColorsLight.infoBg,
              borderRadius: BorderRadius.circular(9.r),
            ),
            child: Row(
              children: [
                Icon(Icons.qr_code_scanner_rounded, size: 14.sp, color: green),
                SizedBox(width: 4.w),
                Text(
                  '${remaining.inMinutes.remainder(60).toString().padLeft(2, '0')}:${remaining.inSeconds.remainder(60).toString().padLeft(2, '0')}',
                  style: isDark
                      ? AppStyles.txnAmountDark.copyWith(fontSize: 14.sp)
                      : AppStyles.txnAmountLight.copyWith(fontSize: 14.sp),
                ),
                SizedBox(width: 4.w),
                Text(
                  l10n.expires,
                  style: isDark
                      ? AppStyles.txnMetaDark.copyWith(fontSize: 12.sp)
                      : AppStyles.txnMetaLight.copyWith(fontSize: 12.sp),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
