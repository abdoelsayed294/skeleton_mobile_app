import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/features/scan_qr/ui/widgets/animated_qr_preview.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class ScanQrCard extends StatelessWidget {
  const ScanQrCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(18.w, 18.h, 18.w, 16.h),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.scanQrCode,
                      style: isDark
                          ? AppStyles.productTitleDark.copyWith(fontSize: 18.sp)
                          : AppStyles.productTitleLight.copyWith(
                              fontSize: 18.sp,
                            ),
                    ),
                    SizedBox(height: 3.h),
                    Text(
                      l10n.openDesktopAppToScan,
                      style: isDark
                          ? AppStyles.productSubtitleDark.copyWith(
                              fontSize: 14.sp,
                            )
                          : AppStyles.productSubtitleLight.copyWith(
                              fontSize: 14.sp,
                            ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 7.h),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.qr_code_2_rounded,
                      size: 13.sp,
                      color: Theme.of(context).primaryColor,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      l10n.desktop,
                      style: isDark
                          ? AppStyles.txnTagDark
                          : AppStyles.txnTagLight,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 18.h),
          Center(child: const AnimatedQrPreview()),
          SizedBox(height: 5.h),
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 7.h),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.qr_code_2_rounded,
                    size: 13.sp,
                    color: Theme.of(context).hintColor,
                  ),
                  SizedBox(width: 7.w),
                  Text(
                    'ELM-2025-DX9KQ',
                    style: isDark
                        ? AppStyles.txnMetaDark
                        : AppStyles.txnMetaLight,
                  ),
                  SizedBox(width: 8.w),
                  Icon(
                    Icons.copy_outlined,
                    size: 14.sp,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
