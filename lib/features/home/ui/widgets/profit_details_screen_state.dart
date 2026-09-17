import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/features/home/ui/scereens/profit_details_screen.dart';
import 'package:skeleton_mobile_app/features/home/ui/widgets/profit_details_header.dart';
import 'package:skeleton_mobile_app/features/home/ui/widgets/expense_breakdown_card.dart';
import 'package:skeleton_mobile_app/features/home/ui/widgets/profit_metric_card.dart';
import 'package:skeleton_mobile_app/features/home/ui/widgets/profit_period_chip.dart';
import 'package:skeleton_mobile_app/features/home/ui/widgets/profit_summary_card.dart';
import 'package:skeleton_mobile_app/features/home/ui/widgets/weekly_profit_summary_card.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class ProfitDetailsScreenState extends State<ProfitDetailsScreen> {
  DateTime selectedDate = DateTime(2025, 1, 15);
  int selectedPeriod = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;
    final positive = isDark ? AppColorsDark.success : AppColorsLight.success;
    final negative = isDark ? AppColorsDark.error : AppColorsLight.error;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 18.h),
                ProfitDetailsHeader(
                  title: l10n.profitDetails,
                  selectedDate: selectedDate,
                  onDateChanged: (date) {
                    setState(() => selectedDate = date);
                  },
                  onBack: () => Navigator.of(context).pop(),
                ),
                SizedBox(height: 12.h),
                Container(
                  padding: EdgeInsets.all(3.w),
                  decoration: BoxDecoration(
                    color: theme.cardColor,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: theme.dividerColor),
                  ),
                  child: Row(
                    children: [
                      ProfitPeriodChip(
                        label: l10n.today,
                        selected: selectedPeriod == 0,
                        onTap: () => setState(() => selectedPeriod = 0),
                      ),
                      ProfitPeriodChip(
                        label: l10n.week,
                        selected: selectedPeriod == 1,
                        onTap: () => setState(() => selectedPeriod = 1),
                      ),
                      ProfitPeriodChip(
                        label: l10n.month,
                        selected: selectedPeriod == 2,
                        onTap: () => setState(() => selectedPeriod = 2),
                      ),
                      ProfitPeriodChip(
                        label: l10n.year,
                        selected: selectedPeriod == 3,
                        onTap: () => setState(() => selectedPeriod = 3),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12.h),
                const ProfitSummaryCard(),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    ProfitMetricCard(
                      label: l10n.grossProfit,
                      value: '9,210',
                      unit: l10n.currencyEgp,
                      change: '+14.2%',
                      accentColor: positive,
                      icon: Icons.bar_chart_rounded,
                    ),
                    SizedBox(width: 12.w),
                    ProfitMetricCard(
                      label: l10n.margin,
                      value: '53.3%',
                      unit: l10n.netMargin,
                      change: '+2.1%',
                      accentColor: positive,
                      icon: Icons.circle,
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    ProfitMetricCard(
                      label: l10n.revenue,
                      value: '12,450',
                      unit: l10n.currencyEgp,
                      change: '+12.5%',
                      accentColor: isDark
                          ? AppColorsDark.primary
                          : AppColorsLight.primary,
                      icon: Icons.circle,
                    ),
                    SizedBox(width: 12.w),
                    ProfitMetricCard(
                      label: l10n.expenses,
                      value: '5,820',
                      unit: l10n.currencyEgp,
                      change: '-3.1%',
                      accentColor: negative,
                      icon: Icons.circle,
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                const ExpenseBreakdownCard(),
                SizedBox(height: 16.h),
                const WeeklyProfitSummaryCard(),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
