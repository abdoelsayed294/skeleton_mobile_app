import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';

class DateSelector extends StatelessWidget {
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateChanged;

  const DateSelector({
    super.key,
    required this.selectedDate,
    required this.onDateChanged,
  });

  Future<void> _selectDate(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (context, child) {
        final theme = Theme.of(context);

        return Theme(
          data: theme.copyWith(
            dialogTheme: DialogThemeData(
              backgroundColor: theme.cardColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.r),
              ),
            ),
            datePickerTheme: DatePickerThemeData(
              backgroundColor: theme.cardColor,
              surfaceTintColor: Colors.transparent,
              headerBackgroundColor: theme.primaryColor,
              headerForegroundColor: Colors.white,
              todayForegroundColor: WidgetStatePropertyAll(theme.primaryColor),
              todayBorder: BorderSide(color: theme.primaryColor, width: 1.2.w),
              dayForegroundColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.selected)) {
                  return Colors.white;
                }
                return theme.textTheme.bodyMedium?.color;
              }),
              dayBackgroundColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.selected)) {
                  return theme.primaryColor;
                }
                return null;
              }),
              yearForegroundColor: WidgetStatePropertyAll(
                theme.textTheme.bodyMedium?.color,
              ),
              cancelButtonStyle: ButtonStyle(
                foregroundColor: WidgetStatePropertyAll(theme.primaryColor),
              ),
              confirmButtonStyle: ButtonStyle(
                foregroundColor: WidgetStatePropertyAll(theme.primaryColor),
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (date != null) {
      onDateChanged(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return InkWell(
      onTap: () => _selectDate(context),
      borderRadius: BorderRadius.circular(14.r),
      child: Container(
        width: 102.w,
        height: 39.h,
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(
            color: Theme.of(context).primaryColor.withOpacity(0.12),
            width: 1.w,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isDark ? 0.16 : 0.08),
              blurRadius: 7.r,
              offset: Offset(0, 3.h),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              Icons.calendar_today_outlined,
              size: 14.sp,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(width: 4.w),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateFormat('MMM d,').format(selectedDate),
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    style: isDark
                        ? AppStyles.font12MediumDark.copyWith(
                            color: AppStyles.font18BoldDark.color,
                            fontWeight: FontWeight.w700,
                          )
                        : AppStyles.font12MediumLight.copyWith(
                            color: AppStyles.font18BoldLight.color,
                            fontWeight: FontWeight.w700,
                          ),
                  ),
                  Text(
                    DateFormat('yyyy').format(selectedDate),
                    maxLines: 1,
                    style: isDark
                        ? AppStyles.font12MediumDark
                        : AppStyles.font12MediumLight,
                  ),
                ],
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 14.sp,
              color: Theme.of(context).hintColor,
            ),
          ],
        ),
      ),
    );
  }
}
