import 'package:flutter/material.dart';

class ExpenseTrendLinePainter extends CustomPainter {
  const ExpenseTrendLinePainter({
    required this.values,
    required this.lineColor,
    required this.gridColor,
    required this.lastValueLabel,
  });

  final List<double> values;
  final Color lineColor;
  final Color gridColor;
  final String lastValueLabel;

  @override
  void paint(Canvas canvas, Size size) {
    if (values.isEmpty) return;
    final gridPaint = Paint()
      ..color = gridColor
      ..strokeWidth = 1;
    for (final fraction in [0.0, 0.5, 1.0]) {
      final y = size.height * fraction;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }
    final maxValue = values.reduce((a, b) => a > b ? a : b);
    final minValue = values.reduce((a, b) => a < b ? a : b);
    final range = maxValue == minValue ? 1.0 : maxValue - minValue;
    final stepX = values.length == 1 ? 0.0 : size.width / (values.length - 1);
    final points = [
      for (var i = 0; i < values.length; i++)
        Offset(
          i * stepX,
          size.height -
              ((values[i] - minValue) / range) * size.height * .8 -
              size.height * .1,
        ),
    ];
    final path = Path()..moveTo(points.first.dx, points.first.dy);
    for (var i = 0; i < points.length - 1; i++) {
      final mid = Offset(
        (points[i].dx + points[i + 1].dx) / 2,
        (points[i].dy + points[i + 1].dy) / 2,
      );
      path.quadraticBezierTo(points[i].dx, points[i].dy, mid.dx, mid.dy);
    }
    path.lineTo(points.last.dx, points.last.dy);
    final fill = Path.from(path)
      ..lineTo(points.last.dx, size.height)
      ..lineTo(points.first.dx, size.height)
      ..close();
    canvas.drawPath(
      fill,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            lineColor.withValues(alpha: .25),
            lineColor.withValues(alpha: 0),
          ],
        ).createShader(Offset.zero & size),
    );
    canvas.drawPath(
      path,
      Paint()
        ..color = lineColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.5
        ..strokeCap = StrokeCap.round,
    );
    for (var i = 0; i < points.length - 1; i++) {
      canvas.drawCircle(points[i], 3.5, Paint()..color = lineColor);
    }
    final last = points.last;
    canvas.drawCircle(last, 5, Paint()..color = lineColor);
    canvas.drawCircle(
      last,
      5,
      Paint()
        ..color = Colors.white
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2,
    );
    final painter = TextPainter(
      text: TextSpan(
        text: lastValueLabel,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    final rect = Rect.fromCenter(
      center: Offset(last.dx - painter.width / 2 - 6, last.dy - 16),
      width: painter.width + 16,
      height: 20,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, const Radius.circular(10)),
      Paint()..color = lineColor,
    );
    painter.paint(canvas, Offset(rect.left + 8, rect.top + 5));
  }

  @override
  bool shouldRepaint(covariant ExpenseTrendLinePainter old) =>
      old.values != values ||
      old.lineColor != lineColor ||
      old.gridColor != gridColor ||
      old.lastValueLabel != lastValueLabel;
}
