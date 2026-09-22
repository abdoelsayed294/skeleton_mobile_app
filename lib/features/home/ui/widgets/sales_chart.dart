
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/features/home/domain/entities/sales_chart_response.dart';

class SalesChart extends StatelessWidget {
  final List<ChartPoint> data;

  const SalesChart({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return SizedBox(
      height: 128.h,
      width: double.infinity,
      child: CustomPaint(
        painter: _SalesChartPainter(
          data: data,
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
  final List<ChartPoint> data;
  final Color lineColor;
  final Color gridColor;
  final TextStyle labelStyle;

  _SalesChartPainter({
    required this.data,
    required this.lineColor,
    required this.gridColor,
    required this.labelStyle,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (data.isEmpty) {
      return;
    }

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

    final maxValue = data.fold<double>(
      0,
      (max, item) => math.max(max, item.total),
    );

    final chartMax = maxValue == 0 ? 1 : maxValue;

    for (var index = 0; index < 4; index++) {
      final y = chartTop + chartHeight * index / 3;

      canvas.drawLine(
        Offset(chartLeft, y),
        Offset(size.width, y),
        gridPaint,
      );

      final value = chartMax * (1 - index / 3);

      _paintText(
        canvas,
        _formatValue(value),
        Offset(0, y - 4.h),
      );
    }

    final points = List.generate(data.length, (index) {
      final normalizedValue = data[index].total / chartMax;

      final x = data.length == 1
          ? chartLeft + chartWidth / 2
          : chartLeft + chartWidth * index / (data.length - 1);

      final y = chartTop + chartHeight * (1 - normalizedValue);

      return Offset(x, y);
    });

    final path = Path()
      ..moveTo(points.first.dx, points.first.dy);

    if (points.length == 1) {
      path.lineTo(points.first.dx, points.first.dy);
    } else {
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
    }

    final fillPaint = Paint()
      ..shader = LinearGradient(
        colors: [
          lineColor.withValues(alpha: 0.2),
          lineColor.withValues(alpha: 0.02),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(
        Rect.fromLTWH(
          chartLeft,
          chartTop,
          chartWidth,
          chartHeight,
        ),
      );

    final fillPath = Path.from(path)
      ..lineTo(
        points.last.dx,
        chartTop + chartHeight,
      )
      ..lineTo(
        points.first.dx,
        chartTop + chartHeight,
      )
      ..close();

    canvas.drawPath(fillPath, fillPaint);
    canvas.drawPath(path, linePaint);

    for (final point in points) {
      canvas.drawCircle(
        point,
        2.2.r,
        Paint()..color = lineColor,
      );

      canvas.drawCircle(
        point,
        1.r,
        Paint()..color = Colors.white,
      );
    }

    for (var index = 0; index < data.length; index++) {
      final rawDate = data[index].date;
      final label = _formatDateLabel(rawDate);
      final text = _textPainter(label);

      final x = data.length == 1
          ? chartLeft + chartWidth / 2
          : chartLeft + chartWidth * index / (data.length - 1);

      text.paint(
        canvas,
        Offset(
          x - text.width / 2,
          size.height - 11.h,
        ),
      );
    }
  }

  String _formatDateLabel(String rawDate) {
    try {
      final dt = DateTime.parse(rawDate);
      return dt.day.toString();
    } catch (_) {
      return rawDate;
    }
  }

  String _formatValue(double value) {
    if (value >= 1000) {
      return '${(value / 1000).toStringAsFixed(1)}K';
    }

    return value.toStringAsFixed(0);
  }

  void _paintText(
    Canvas canvas,
    String value,
    Offset offset,
  ) {
    _textPainter(value).paint(canvas, offset);
  }

  TextPainter _textPainter(String value) {
    return TextPainter(
      text: TextSpan(
        text: value,
        style: labelStyle,
      ),
      textDirection: TextDirection.ltr,
    )..layout();
  }

  @override
  bool shouldRepaint(
    covariant _SalesChartPainter oldDelegate,
  ) {
    return oldDelegate.lineColor != lineColor ||
        oldDelegate.gridColor != gridColor ||
        oldDelegate.labelStyle != labelStyle ||
        oldDelegate.data != data;
  }
}

