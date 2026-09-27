import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/features/expeness/ui/widgets/expense_stat_column.dart';
import 'package:skeleton_mobile_app/features/expeness/ui/widgets/expense_stat_divider.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

/// Gradient hero card at the top of the Expenses screen: total amount,
/// the % change vs. last period and a 3-way stats row (transactions,
/// average per transaction, daily average).
class TotalExpensesSummaryCard extends StatelessWidget {
  const TotalExpensesSummaryCard({
    super.key,
    required this.periodLabel,
    required this.totalAmount,
    required this.changePercent,
    required this.previousAmount,
    required this.transactionsCount,
    required this.avgPerTransaction,
    required this.dailyAverage,
  });

  final String periodLabel;
  final double totalAmount;
  final double changePercent;
  final double previousAmount;
  final int transactionsCount;
  final double avgPerTransaction;
  final double dailyAverage;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;
    final isIncrease = changePercent >= 0;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(22.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22.r),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            isDark
                ? AppColorsDark.primaryGradientStart
                : AppColorsLight.primaryGradientStart,
            isDark
                ? AppColorsDark.primaryGradientEnd
                : AppColorsLight.primaryGradientEnd,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.totalExpensesFor(periodLabel).toUpperCase(),
            style: GoogleFonts.plusJakartaSans(
              fontSize: 11.sp,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
              color: Colors.white.withValues(alpha: 0.85),
            ),
          ),
          SizedBox(height: 6.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                totalAmount.toStringAsFixed(0),
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 38.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  letterSpacing: -1,
                  height: 1,
                ),
              ),
              SizedBox(width: 8.w),
              Padding(
                padding: EdgeInsets.only(bottom: 4.h),
                child: Text(
                  l10n.currencyEgp,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Padding(
                padding: EdgeInsets.only(bottom: 6.h),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    '${isIncrease ? '+' : ''}${changePercent.toStringAsFixed(1)}%',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 6.h),
          Text(
            l10n.expensesComparedToPreviousPeriod(
              previousAmount.toStringAsFixed(0),
            ),
            style: GoogleFonts.plusJakartaSans(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: Colors.white.withValues(alpha: 0.85),
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              ExpenseStatColumn(
                value: '$transactionsCount',
                label: l10n.transactions,
              ),
              const ExpenseStatDivider(),
              ExpenseStatColumn(
                value: avgPerTransaction.toStringAsFixed(0),
                label: l10n.avgPerTransaction,
              ),
              const ExpenseStatDivider(),
              ExpenseStatColumn(
                value: dailyAverage.toStringAsFixed(0),
                label: l10n.dailyAverage,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
