import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/features/reports/domain/entities/daily_sales_entity.dart';

class ReportsDailySalesChart extends StatelessWidget {
  final List<DailySalesEntity> points;

  const ReportsDailySalesChart({super.key, required this.points});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final color = isDark ? AppColorsDark.primary : AppColorsLight.primary;
    final maxRevenue = points.fold<double>(
      0,
      (maxValue, point) => math.max(maxValue, point.revenue),
    );

    return SizedBox(
      height: 62.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: points.map((point) {
          final ratio = maxRevenue == 0 ? 0.04 : point.revenue / maxRevenue;
          return Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 1.2.w),
              child: Tooltip(
                message:
                    '${point.date?.day ?? ''}: ${point.revenue.toStringAsFixed(0)}',
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: FractionallySizedBox(
                    heightFactor: ratio.clamp(0.04, 1.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: color.withValues(alpha: 0.8),
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(3.r),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
