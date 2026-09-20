import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:skeleton_mobile_app/core/routing/routes.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class QrScannerScreen extends StatefulWidget {
  const QrScannerScreen({super.key});

  @override
  State<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen> {
  bool isNavigating = false;

  void handleDetection(BarcodeCapture capture) {
    if (isNavigating || capture.barcodes.isEmpty) {
      return;
    }

    final barcode = capture.barcodes.firstWhere(
      (barcode) => barcode.rawValue?.isNotEmpty ?? false,
      orElse: () => capture.barcodes.first,
    );

    final token = barcode.rawValue;

    if (token == null || token.isEmpty) {
      return;
    }

    isNavigating = true;

    debugPrint('QR Token: $token');

    Navigator.of(context).pushReplacementNamed(
      Routes.mainScreen,
      arguments: token,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(l10n.scanQr),
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          MobileScanner(
            onDetect: handleDetection,
          ),

          Center(
            child: Container(
              width: 270.w,
              height: 270.w,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 3.w,
                ),
                borderRadius: BorderRadius.circular(24.r),
              ),
            ),
          ),

          Positioned(
            left: 24.w,
            right: 24.w,
            bottom: 34.h,
            child: Text(
              l10n.alignQrInFrame,
              textAlign: TextAlign.center,
              style: AppStyles.totalSalesChangeLight,
            ),
          ),
        ],
      ),
    );
  }
}