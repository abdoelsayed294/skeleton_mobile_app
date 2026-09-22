import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:skeleton_mobile_app/core/routing/routes.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/core/widgets/dilaog_utils.dart';
import 'package:skeleton_mobile_app/features/scan_qr/domain/entity/qr_response.dart';
import 'package:skeleton_mobile_app/features/scan_qr/logic/qr_cubit.dart';
import 'package:skeleton_mobile_app/features/scan_qr/ui/widgets/qr_listener.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class QrScannerScreen extends StatefulWidget {
  const QrScannerScreen({super.key});

  @override
  State<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen> {
  bool isNavigating = false;
  final MobileScannerController _scannerController = MobileScannerController();
  final ImagePicker _imagePicker = ImagePicker();

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

    context.read<QrCubit>().getQrStatus(token);
  }

  Future<void> _scanImageFromGallery() async {
    if (isNavigating) return;

    final image = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (image == null || !mounted) return;

    setState(() => isNavigating = true);
    try {
      final barcodeCapture = await _scannerController.analyzeImage(image.path);

      if (!mounted) return;
      if (barcodeCapture == null || barcodeCapture.barcodes.isEmpty) {
        setState(() => isNavigating = false);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No QR code was found in this image.')),
        );
        return;
      }

      setState(() => isNavigating = false);
      handleDetection(barcodeCapture);
    } catch (_) {
      if (!mounted) return;
      setState(() => isNavigating = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Unable to scan this image.')),
      );
    }
  }

  @override
  void dispose() {
    _scannerController.dispose();
    super.dispose();
  }

  Future<void> handleQrSuccess(QrResponse qrResponse) async {
    final l10n = AppLocalizations.of(context)!;

    if (qrResponse.status?.toLowerCase() != 'approved') {
      isNavigating = false;
      DialogUtils.showMessage(
        context: context,
        type: DialogType.error,
        title: l10n.invalidQrTitle,
        message: qrResponse.message ?? l10n.invalidQrMessage,
      );
      return;
    }
    if (!mounted) return;
    Navigator.of(
      context,
    ).pushNamedAndRemoveUntil(Routes.mainScreen, (route) => false);
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
            controller: _scannerController,
            onDetect: handleDetection,
          ),

          Center(
            child: Container(
              width: 270.w,
              height: 270.w,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 3.w),
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
          Positioned(
            right: 24.w,
            bottom: 24.h,
            child: FilledButton.icon(
              onPressed: isNavigating ? null : _scanImageFromGallery,
              icon: const Icon(Icons.photo_library_outlined),
              label: const Text('Scan from image'),
            ),
          ),
          QrBlocListener(
            onSuccess: handleQrSuccess,
            onError: () {
              isNavigating = false;
            },
          ),
        ],
      ),
    );
  }
}

/// api service<< data source << repository <<use case<<bloc << ui
