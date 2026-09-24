import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/features/profit_details/ui/widgets/expense_breakdown_card.dart';
import 'package:skeleton_mobile_app/features/profit_details/ui/widgets/profit_details_filters.dart';
import 'package:skeleton_mobile_app/features/profit_details/ui/widgets/profit_metric_card.dart';
import 'package:skeleton_mobile_app/features/profit_details/ui/widgets/profit_summary_card.dart';
import 'package:skeleton_mobile_app/features/profit_details/ui/widgets/weekly_profit_summary_card.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class ProfitDetailsScreen extends StatelessWidget {
  const ProfitDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
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
                const ProfitDetailsFilters(),
                SizedBox(height: 12.h),
                const ProfitSummaryCard(),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    ProfitMetricCard(
                      label: l10n.grossProfit,
                      unit: l10n.currencyEgp,
                      accentColor: positive,
                      icon: Icons.bar_chart_rounded,
                      metricType: ProfitMetricType.grossProfit,
                    ),
                    SizedBox(width: 12.w),
                    ProfitMetricCard(
                      label: l10n.margin,
                      unit: l10n.netMargin,
                      accentColor: positive,
                      icon: Icons.circle,
                      metricType: ProfitMetricType.margin,
                      isPercentage: true,
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    ProfitMetricCard(
                      label: l10n.revenue,
                      unit: l10n.currencyEgp,
                      accentColor: isDark
                          ? AppColorsDark.primary
                          : AppColorsLight.primary,
                      icon: Icons.circle,
                      metricType: ProfitMetricType.revenue,
                    ),
                    SizedBox(width: 12.w),
                    ProfitMetricCard(
                      label: l10n.expenses,
                      unit: l10n.currencyEgp,
                      accentColor: negative,
                      icon: Icons.circle,
                      metricType: ProfitMetricType.expenses,
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
