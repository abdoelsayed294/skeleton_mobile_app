import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/features/reports/domain/entities/payment_breakdown_entity.dart';

class ReportsPaymentBreakdown extends StatelessWidget {
  final List<PaymentBreakdownEntity> items;

  const ReportsPaymentBreakdown({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final labelStyle = isDark
        ? AppStyles.font12MediumDark
        : AppStyles.font12MediumLight;
    final colors = [
      isDark ? AppColorsDark.primary : AppColorsLight.primary,
      isDark ? AppColorsDark.success : AppColorsLight.success,
      isDark ? AppColorsDark.warning : AppColorsLight.warning,
      isDark ? AppColorsDark.accentPurple : AppColorsLight.accentPurple,
    ];

    return Column(
      children: List.generate(items.length, (index) {
        final item = items[index];
        final color = colors[index % colors.length];
        return Padding(
          padding: EdgeInsets.only(bottom: 6.h),
          child: Row(
            children: [
              Container(
                width: 7.w,
                height: 7.w,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              ),
              SizedBox(width: 7.w),
              Expanded(
                child: Text(
                  item.method,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: labelStyle,
                ),
              ),
              Text(
                '${item.percent.toStringAsFixed(0)}% · ${item.count}',
                style: labelStyle.copyWith(color: color),
              ),
            ],
          ),
        );
      }),
    );
  }
}
