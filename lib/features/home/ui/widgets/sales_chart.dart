import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';

class SalesChart extends StatelessWidget {
  final List<String> timeLabels;

  const SalesChart({super.key, required this.timeLabels});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return SizedBox(
      height: 128.h,
      width: double.infinity,
      child: CustomPaint(
        painter: _SalesChartPainter(
          timeLabels: timeLabels,
          lineColor: theme.primaryColor,
          gridColor: theme.dividerColor,
          labelStyle: isDark
              ? AppStyles.salesChartLabelDark
              : AppStyles.salesChartLabelLight,
        ),
      ),
    );
  }
}

class _SalesChartPainter extends CustomPainter {
  final List<String> timeLabels;
  final Color lineColor;
  final Color gridColor;
  final TextStyle labelStyle;

  _SalesChartPainter({
    required this.timeLabels,
    required this.lineColor,
    required this.gridColor,
    required this.labelStyle,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const values = [0.82, 0.62, 0.58, 0.50, 0.42, 0.35, 0.24];
    final chartLeft = 22.w;
    final chartTop = 5.h;
    final chartWidth = size.width - chartLeft;
    final chartHeight = size.height - 23.h;
    final gridPaint = Paint()
      ..color = gridColor.withValues(alpha: 0.55)
      ..strokeWidth = 0.7;
    final linePaint = Paint()
      ..color = lineColor
      ..strokeWidth = 1.6.w
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;
    final fillPaint = Paint()
      ..shader =
          LinearGradient(
            colors: [
              lineColor.withValues(alpha: 0.2),
              lineColor.withValues(alpha: 0.02),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ).createShader(
            Rect.fromLTWH(chartLeft, chartTop, chartWidth, chartHeight),
          );

    for (var index = 0; index < 4; index++) {
      final y = chartTop + chartHeight * index / 3;
      canvas.drawLine(Offset(chartLeft, y), Offset(size.width, y), gridPaint);
      _paintText(canvas, '${15 - index * 5}K', Offset(0, y - 4.h));
    }

    final points = List.generate(values.length, (index) {
      return Offset(
        chartLeft + chartWidth * index / (values.length - 1),
        chartTop + chartHeight * values[index],
      );
    });
    final path = Path()..moveTo(points.first.dx, points.first.dy);

    for (var index = 1; index < points.length; index++) {
      final previous = points[index - 1];
      final current = points[index];
      final controlX = (previous.dx + current.dx) / 2;
      path.cubicTo(
        controlX,
        previous.dy,
        controlX,
        current.dy,
        current.dx,
        current.dy,
      );
    }

    final fillPath = Path.from(path)
      ..lineTo(points.last.dx, chartTop + chartHeight)
      ..lineTo(points.first.dx, chartTop + chartHeight)
      ..close();
    canvas.drawPath(fillPath, fillPaint);
    canvas.drawPath(path, linePaint);

    for (final point in points) {
      canvas.drawCircle(point, 2.2.r, Paint()..color = lineColor);
      canvas.drawCircle(point, 1.r, Paint()..color = Colors.white);
    }

    for (var index = 0; index < timeLabels.length; index++) {
      final text = _textPainter(timeLabels[index]);
      final x = chartLeft + chartWidth * index / (timeLabels.length - 1);
      text.paint(canvas, Offset(x - text.width / 2, size.height - 11.h));
    }
  }

  void _paintText(Canvas canvas, String value, Offset offset) {
    _textPainter(value).paint(canvas, offset);
  }

  TextPainter _textPainter(String value) {
    return TextPainter(
      text: TextSpan(text: value, style: labelStyle),
      textDirection: TextDirection.ltr,
    )..layout();
  }

  @override
  bool shouldRepaint(covariant _SalesChartPainter oldDelegate) {
    return oldDelegate.lineColor != lineColor ||
        oldDelegate.gridColor != gridColor ||
        oldDelegate.labelStyle != labelStyle ||
        oldDelegate.timeLabels != timeLabels;
  }
}
