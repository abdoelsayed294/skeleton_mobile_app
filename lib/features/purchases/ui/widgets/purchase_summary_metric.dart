import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';

class PurchaseSummaryMetric extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final IconData icon;
  final Color color;

  const PurchaseSummaryMetric({
    super.key,
    required this.title,
    required this.value,
    required this.subtitle,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 10.h),
      decoration: BoxDecoration(
        color: isDark
            ? AppColorsDark.background
            : Colors.white.withValues(alpha: .72),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: isDark ? AppColorsDark.border : AppColorsLight.border,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 15.sp, color: color),
              SizedBox(width: 6.w),
              Text(
                title,
                style:
                    (isDark
                            ? AppStyles.statTitleDark
                            : AppStyles.statTitleLight)
                        .copyWith(fontSize: 10),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            value,
            style: (isDark ? AppStyles.statValueDark : AppStyles.statValueLight)
                .copyWith(fontSize: 22),
          ),
          Text(
            subtitle,
            style:
                (isDark
                        ? AppStyles.font12MediumDark
                        : AppStyles.font12MediumLight)
                    .copyWith(
                      color: isDark
                          ? AppColorsDark.textMuted
                          : AppColorsLight.textMuted,
                      fontSize: 10,
                    ),
          ),
        ],
      ),
    );
  }
}
