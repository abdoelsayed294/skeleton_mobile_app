import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/features/home/ui/widgets/date_selector.dart';

class ProfitDetailsHeader extends StatelessWidget {
  final String title;
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateChanged;
  final VoidCallback onBack;

  const ProfitDetailsHeader({
    super.key,
    required this.title,
    required this.selectedDate,
    required this.onDateChanged,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: onBack,
          borderRadius: BorderRadius.circular(16.r),
          child: Container(
            width: 50.w,
            height: 50.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: Theme.of(context).dividerColor),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.06),
                  blurRadius: 7.r,
                  offset: Offset(0, 3.h),
                ),
              ],
            ),
            child: Icon(Icons.swap_horiz_rounded, size: 21.sp),
          ),
        ),
        SizedBox(width: 14.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'El-Masry Retail',
                style: isDark
                    ? AppStyles.font12MediumDark
                    : AppStyles.font12MediumLight,
              ),
              Text(
                title,
                style: isDark
                    ? AppStyles.reportsHeaderTitleDark.copyWith(fontSize: 22)
                    : AppStyles.reportsHeaderTitleLight.copyWith(fontSize: 22),
              ),
            ],
          ),
        ),
        DateSelector(selectedDate: selectedDate, onDateChanged: onDateChanged),
      ],
    );
  }
}
