import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/widgets/custom_elveted_buttom.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class ScanQrButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ScanQrButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return CustomElevatedButton(
      text: l10n.scanDesktopQrCode,
      icon: Icons.qr_code_scanner_rounded,
      onPressed: onPressed,
      textStyle: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w800,
        color: Colors.white,
      ),
    );
  }
}
