import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';

class PaymentMethodRow extends StatelessWidget {
  final Color color;
  final String label;
  final double fraction;
  final bool isDark;

  const PaymentMethodRow({
    required this.color,
    required this.label,
    required this.fraction,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 7.w,
          height: 7.w,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        SizedBox(width: 6.w),
        SizedBox(
          width: 42.w,
          child: Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: isDark
                ? AppStyles.paymentLegendLabelDark
                : AppStyles.paymentLegendLabelLight,
          ),
        ),
        SizedBox(width: 6.w),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4.r),
            child: LinearProgressIndicator(
              value: fraction,
              minHeight: 6.h,
              backgroundColor: color.withValues(alpha: 0.12),
              valueColor: AlwaysStoppedAnimation(color),
            ),
          ),
        ),
        SizedBox(width: 8.w),
        SizedBox(
          width: 32.w,
          child: Text(
            '${(fraction * 100).round()}%',
            textAlign: TextAlign.end,
            style: isDark
                ? AppStyles.paymentLegendPercentDark
                : AppStyles.paymentLegendPercentLight,
          ),
        ),
      ],
    );
  }
}