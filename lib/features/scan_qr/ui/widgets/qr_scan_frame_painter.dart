import 'package:flutter/material.dart';

class QrScanFramePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double cornerLength;

  const QrScanFramePainter({
    required this.color,
    required this.strokeWidth,
    required this.cornerLength,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square;

    final left = strokeWidth / 2;
    final top = strokeWidth / 2;
    final right = size.width - strokeWidth / 2;
    final bottom = size.height - strokeWidth / 2;

    canvas
      ..drawLine(Offset(left, top), Offset(left + cornerLength, top), paint)
      ..drawLine(Offset(left, top), Offset(left, top + cornerLength), paint)
      ..drawLine(Offset(right, top), Offset(right - cornerLength, top), paint)
      ..drawLine(Offset(right, top), Offset(right, top + cornerLength), paint)
      ..drawLine(
        Offset(left, bottom),
        Offset(left + cornerLength, bottom),
        paint,
      )
      ..drawLine(
        Offset(left, bottom),
        Offset(left, bottom - cornerLength),
        paint,
      )
      ..drawLine(
        Offset(right, bottom),
        Offset(right - cornerLength, bottom),
        paint,
      )
      ..drawLine(
        Offset(right, bottom),
        Offset(right, bottom - cornerLength),
        paint,
      );
  }

  @override
  bool shouldRepaint(covariant QrScanFramePainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.cornerLength != cornerLength;
  }
}
