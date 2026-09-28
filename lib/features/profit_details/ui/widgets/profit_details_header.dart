import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/helpers/shared_pref_helper.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/features/home/ui/widgets/date_selector.dart';

class ProfitDetailsHeader extends StatelessWidget {
  final String title;
  final DateTime? selectedDate;
  final ValueChanged<DateTime>? onDateChanged;
  final VoidCallback onBack;
  final bool showDateSelector;

  const ProfitDetailsHeader({
    super.key,
    required this.title,
    this.selectedDate,
    this.onDateChanged,
    required this.onBack,
    this.showDateSelector = true,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isLandscape =
        MediaQuery.orientationOf(context) == Orientation.landscape;
    final buttonSize = isLandscape ? 38.0 : 38.w;
    final iconSize = isLandscape ? 18.0 : 18.sp;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: onBack,
          borderRadius: BorderRadius.circular(16.r),
          child: Container(
            width: buttonSize,
            height: buttonSize,
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
            child: Icon(Icons.swap_horiz_rounded, size: iconSize),
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder<String>(
                future: SharedPrefHelper.getString(
                  SharedPrefHelper.businessNameKey,
                ),
                builder: (context, snapshot) {
                  final businessName = snapshot.data?.trim();
                  return Text(
                    businessName == null || businessName.isEmpty
                        ? 'Skeleton'
                        : businessName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: isDark
                        ? AppStyles.font12MediumDark
                        : AppStyles.font12MediumLight,
                  );
                },
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
        if (showDateSelector && selectedDate != null && onDateChanged != null)
          DateSelector(
            selectedDate: selectedDate!,
            onDateChanged: onDateChanged!,
          ),
      ],
    );
  }
}
