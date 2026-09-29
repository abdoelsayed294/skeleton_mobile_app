import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeleton/core/theming/app_color.dart';
import 'package:skeleton/features/expeness/ui/widgets/expense_category.dart';
import 'package:skeleton/l10n/app_localizations.dart';

class ExpenseCategoryRow extends StatelessWidget {
  const ExpenseCategoryRow({super.key, required this.category});

  final ExpenseCategory category;

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;
    return Row(
      children: [
        Container(
          width: 36.w,
          height: 36.w,
          decoration: BoxDecoration(
            color: category.iconBg,
            borderRadius: BorderRadius.circular(11.r),
          ),
          child: Icon(category.icon, size: 20.sp, color: category.amountColor),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: category.title,
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                        color: dark
                            ? AppColorsDark.textPrimary
                            : AppColorsLight.textPrimary,
                      ),
                    ),
                    if (category.subtitle.isNotEmpty)
                      TextSpan(
                        text: '  ${category.subtitle}',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 10.sp,
                          color: dark
                              ? AppColorsDark.textSecondary
                              : AppColorsLight.textSecondary,
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(height: 6.h),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: LinearProgressIndicator(
                  value: (category.percent / 100).clamp(0, 1),
                  minHeight: 5.h,
                  backgroundColor: dark
                      ? AppColorsDark.border
                      : AppColorsLight.border,
                  valueColor: AlwaysStoppedAnimation(category.barGradientEnd),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 12.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: category.amount.toStringAsFixed(0),
                    style: GoogleFonts.jetBrainsMono(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w700,
                      color: category.amountColor,
                    ),
                  ),
                  TextSpan(
                    text: ' ${l10n.currencyEgp}',
                    style: GoogleFonts.jetBrainsMono(
                      fontSize: 9.sp,
                      color: dark
                          ? AppColorsDark.textSecondary
                          : AppColorsLight.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              '${category.percent}%',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 10.sp,
                color: dark
                    ? AppColorsDark.textSecondary
                    : AppColorsLight.textSecondary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
