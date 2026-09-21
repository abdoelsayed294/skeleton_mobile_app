import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/features/scan_qr/ui/widgets/qr_code_painter.dart';
import 'package:skeleton_mobile_app/features/scan_qr/ui/widgets/qr_scan_frame_painter.dart';

class AnimatedQrPreview extends StatefulWidget {
  const AnimatedQrPreview({super.key});

  @override
  State<AnimatedQrPreview> createState() => _AnimatedQrPreviewState();
}

class _AnimatedQrPreviewState extends State<AnimatedQrPreview>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> scanProgress;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2200),
    )..repeat(reverse: true);
    scanProgress = CurvedAnimation(parent: controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: scanProgress,
      builder: (context, child) {
        return SizedBox(
          width: 246.w,
          height: 246.w,
          child: Stack(
            children: [
              Positioned(
                left: 20.w,
                top: 20.w,
                width: 206.w,
                height: 206.w,
                child: CustomPaint(painter: const QrCodePainter()),
              ),
              Positioned.fill(
                child: CustomPaint(
                  painter: QrScanFramePainter(
                    color: Theme.of(context).primaryColor,
                    strokeWidth: 3.w,
                    cornerLength: 30.w,
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: 49.w,
                  height: 49.w,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(7.r),
                  ),
                ),
              ),
              Positioned(
                left: 20.w,
                right: 20.w,
                top: 20.w + (206.w * scanProgress.value),
                child: Container(
                  height: 2.h,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(
                          context,
                        ).primaryColor.withValues(alpha: 0.65),
                        blurRadius: 7.r,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
