import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/features/scan_qr/ui/widgets/scan_instruction_item.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class ScanInstructionsCard extends StatelessWidget {
  const ScanInstructionsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(14.w, 15.h, 14.w, 8.h),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.howToConnect,
            style: isDark
                ? AppStyles.productTitleDark.copyWith(fontSize: 17.sp)
                : AppStyles.productTitleLight.copyWith(fontSize: 17.sp),
          ),
          SizedBox(height: 13.h),
          ScanInstructionItem(
            number: 1,
            title: l10n.openSkeletonDesktopApp,
            description: l10n.launchAppOnComputer,
            icon: Icons.open_in_new_rounded,
            showDivider: true,
          ),
          ScanInstructionItem(
            number: 2,
            title: l10n.goToConnectMobile,
            description: l10n.findQrCodeOnDesktop,
            icon: Icons.qr_code_scanner_rounded,
            showDivider: true,
          ),
          ScanInstructionItem(
            number: 3,
            title: l10n.scanDesktopQrWithApp,
            description: l10n.pointCameraAtDesktop,
            icon: Icons.center_focus_weak_rounded,
            showDivider: false,
          ),
        ],
      ),
    );
  }
}
