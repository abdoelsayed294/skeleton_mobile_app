import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

enum ExpensesPeriod { day, week, month, quarter, year }

/// Horizontal segmented control used at the top of the Expenses screen
/// to switch the reporting period (Day / Week / Month / Quarter / Year).
class ExpensesPeriodSelector extends StatelessWidget {
  const ExpensesPeriodSelector({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  final ExpensesPeriod selected;
  final ValueChanged<ExpensesPeriod> onChanged;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;

    final items = <ExpensesPeriod, String>{
      ExpensesPeriod.day: l10n.day,
      ExpensesPeriod.week: l10n.week,
      ExpensesPeriod.month: l10n.month,
      ExpensesPeriod.quarter: l10n.quarter,
      ExpensesPeriod.year: l10n.year,
    };

    return Row(
      children: items.entries.map((entry) {
        final isSelected = entry.key == selected;
        return Padding(
          padding: EdgeInsets.only(right: 4.w),
          child: GestureDetector(
            onTap: () => onChanged(entry.key),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 7.h),
              decoration: BoxDecoration(
                color: isSelected
                    ? (isDark ? AppColorsDark.primary : AppColorsLight.primary)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(9.r),
              ),
              child: Text(
                entry.value,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: isSelected
                      ? Colors.white
                      : (isDark
                            ? AppColorsDark.textSecondary
                            : AppColorsLight.textSecondary),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
