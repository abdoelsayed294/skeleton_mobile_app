import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Indicator extends StatelessWidget {
  final double progress;
  final double startX;
  final double endX;
  final Color color;

  const Indicator({
    super.key,
    required this.progress,
    required this.startX,
    required this.endX,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final currentX = lerpDouble(startX, endX, progress)!;
    final isLandscape =
        MediaQuery.sizeOf(context).width > MediaQuery.sizeOf(context).height;
    final width = isLandscape ? 51.0 : 51.r;
    final height = isLandscape ? 6.0 : 6.r;

    return Positioned(
      left: currentX - width / 2,
      top: 0,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.vertical(bottom: Radius.circular(4)),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.7),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
            BoxShadow(
              color: color.withValues(alpha: 0.4),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
        ),
      ),
    );
  }
}
