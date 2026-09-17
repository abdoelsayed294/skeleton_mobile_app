import 'dart:math' as math;

import 'package:flutter/material.dart';

class ExpenseDonutPainter extends CustomPainter {
  final List<double> values;
  final List<Color> colors;

  ExpenseDonutPainter({required this.values, required this.colors});

  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth = size.width * 0.18;
    final radius = size.shortestSide / 2 - strokeWidth / 2;
    final center = size.center(Offset.zero);
    final rect = Rect.fromCircle(center: center, radius: radius);
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.butt;
    var startAngle = -math.pi / 2;

    for (var index = 0; index < values.length; index++) {
      final sweepAngle = math.pi * 2 * values[index];
      paint.color = colors[index];
      canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
      startAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(covariant ExpenseDonutPainter oldDelegate) {
    return oldDelegate.values != values || oldDelegate.colors != colors;
  }
}
