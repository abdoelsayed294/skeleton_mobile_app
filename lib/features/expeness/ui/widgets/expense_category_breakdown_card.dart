import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/features/expeness/ui/widgets/expense_category.dart';
import 'package:skeleton_mobile_app/features/expeness/ui/widgets/expense_category_row.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

/// "By Category" card: expense distribution across categories, each row
/// with an icon, a gradient progress bar, the amount and its percentage.
class ExpenseCategoryBreakdownCard extends StatelessWidget {
  const ExpenseCategoryBreakdownCard({super.key, required this.categories});

  final List<ExpenseCategory> categories;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(18.w),
      decoration: BoxDecoration(
        color: isDark ? AppColorsDark.surface : AppColorsLight.surface,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: isDark ? AppColorsDark.border : AppColorsLight.border,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.byCategory,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: isDark
                          ? AppColorsDark.textPrimary
                          : AppColorsLight.textPrimary,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    l10n.byCategorySubtitle,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                      color: isDark
                          ? AppColorsDark.textSecondary
                          : AppColorsLight.textSecondary,
                    ),
                  ),
                ],
              ),
              Container(
                width: 52.w,
                height: 52.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isDark ? AppColorsDark.border : AppColorsLight.infoBg,
                  shape: BoxShape.circle,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${categories.length}',
                      style: GoogleFonts.jetBrainsMono(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: isDark
                            ? AppColorsDark.textPrimary
                            : AppColorsLight.textPrimary,
                      ),
                    ),
                    Text(
                      l10n.categoriesShort,
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 7.sp,
                        color: isDark
                            ? AppColorsDark.textSecondary
                            : AppColorsLight.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 18.h),
          for (final category in categories) ...[
            ExpenseCategoryRow(category: category),
            if (category != categories.last) SizedBox(height: 18.h),
          ],
        ],
      ),
    );
  }
}
