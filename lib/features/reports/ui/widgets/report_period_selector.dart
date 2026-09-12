import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';

class ReportPeriodSelector extends StatelessWidget {
  final int selectedPeriod;
  final List<String> labels;
  final ValueChanged<int> onChanged;

  const ReportPeriodSelector({
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
      padding: EdgeInsets.all(3.w),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: theme.dividerColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.14 : 0.04),
            blurRadius: 8.r,
            offset: Offset(0, 3.h),
          ),
        ],
      ),
      child: Row(
        children: List.generate(labels.length, (index) {
          final isSelected = selectedPeriod == index;
          final labelStyle = isDark
              ? AppStyles.salesOverviewFilterDark
              : AppStyles.salesOverviewFilterLight;

          return Expanded(
            child: GestureDetector(
              onTap: () => onChanged(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                padding: EdgeInsets.symmetric(vertical: 8.h),
                decoration: BoxDecoration(
                  color: isSelected ? theme.primaryColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(9.r),
                ),
                alignment: Alignment.center,
                child: Text(
                  labels[index],
                  textAlign: TextAlign.center,
                  style: labelStyle.copyWith(
                    color: isSelected ? Colors.white : labelStyle.color,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
