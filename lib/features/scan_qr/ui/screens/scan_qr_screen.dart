import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/routing/routes.dart';
import 'package:skeleton_mobile_app/features/scan_qr/ui/widgets/scan_instructions_card.dart';
import 'package:skeleton_mobile_app/features/scan_qr/ui/widgets/scan_qr_button.dart';
import 'package:skeleton_mobile_app/features/scan_qr/ui/widgets/scan_qr_card.dart';
import 'package:skeleton_mobile_app/features/scan_qr/ui/widgets/scan_qr_header.dart';
import 'package:skeleton_mobile_app/features/scan_qr/ui/widgets/scan_status_card.dart';

class ScanQrScreen extends StatefulWidget {
  const ScanQrScreen({super.key});

  @override
  State<ScanQrScreen> createState() => _ScanQrScreenState();
}

class _ScanQrScreenState extends State<ScanQrScreen> {
  static const _initialTime = Duration(minutes: 4, seconds: 58);

  Duration remaining = _initialTime;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) {
        return;
      }
      if (remaining == Duration.zero) {
        timer?.cancel();
        return;
      }
      setState(() => remaining -= const Duration(seconds: 1));
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void openScanner() {
    Navigator.of(context).pushNamed(Routes.qrScannerScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 26.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ScanQrHeader(),
              SizedBox(height: 14.h),
              ScanStatusCard(remaining: remaining),
              SizedBox(height: 14.h),
              const ScanQrCard(),
              SizedBox(height: 14.h),
              const ScanInstructionsCard(),
              SizedBox(height: 14.h),
              ScanQrButton(onPressed: openScanner),
            ],
          ),
        ),
      ),
    );
  }
}
