import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';

class SalesPeriodSelector extends StatelessWidget {
  final int selectedPeriod;
  final List<String> labels;
  final ValueChanged<int> onChanged;

  const SalesPeriodSelector({
    super.key,
    required this.selectedPeriod,
    required this.labels,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.all(1.5.w),
      decoration: BoxDecoration(
        color: theme.primaryColor.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(labels.length, (index) {
          final isSelected = selectedPeriod == index;
          final labelStyle = isDark
              ? AppStyles.salesOverviewFilterDark
              : AppStyles.salesOverviewFilterLight;

          return GestureDetector(
            onTap: () => onChanged(index),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.h),
              decoration: BoxDecoration(
                color: isSelected ? theme.primaryColor : Colors.transparent,
                borderRadius: BorderRadius.circular(7.r),
              ),
              child: Text(
                labels[index],
                style: labelStyle.copyWith(
                  color: isSelected ? Colors.white : labelStyle.color,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
