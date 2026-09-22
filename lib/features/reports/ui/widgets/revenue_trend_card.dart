
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/features/home/domain/entities/sales_chart_response.dart';
import 'package:skeleton_mobile_app/features/home/ui/widgets/sales_chart.dart';
import 'package:skeleton_mobile_app/features/reports/ui/widgets/report_period_selector.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class RevenueTrendCard extends StatefulWidget {
  final String monthName;

  const RevenueTrendCard({
    super.key,
    this.monthName = 'November',
  });

  @override
  State<RevenueTrendCard> createState() => _RevenueTrendCardState();
}

class _RevenueTrendCardState extends State<RevenueTrendCard> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;

    final chartData = [
      ChartPoint(
        date: l10n.dayMon,
        total: 0,
        count: 0,
      ),
      ChartPoint(
        date: l10n.dayTue,
        total: 0,
        count: 0,
      ),
      ChartPoint(
        date: l10n.dayWed,
        total: 0,
        count: 0,
      ),
      ChartPoint(
        date: l10n.dayThu,
        total: 0,
        count: 0,
      ),
      ChartPoint(
        date: l10n.dayFri,
        total: 0,
        count: 0,
      ),
      ChartPoint(
        date: l10n.daySat,
        total: 0,
        count: 0,
      ),
    ];

    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 14.h, 16.w, 14.h),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: isDark
              ? theme.dividerColor
              : AppColorsLight.border.withValues(alpha: 0.9),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(
              alpha: isDark ? 0.14 : 0.04,
            ),
            blurRadius: 8.r,
            offset: Offset(0, 3.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  l10n.salesPerformance,
                  style: isDark
                      ? AppStyles.salesOverviewTitleDark
                      : AppStyles.salesOverviewTitleLight,
                ),
              ),
              SizedBox(
                width: 168.w,
                child: ReportPeriodSelector(
                  selectedPeriod: selectedTab,
                  labels: [
                    l10n.filterDaily,
                    l10n.filterWeekly,
                    l10n.filterMonthly,
                  ],
                  onChanged: (period) {
                    setState(() {
                      selectedTab = period;
                    });
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Text(
            '${l10n.dailyOverview} — ${widget.monthName}',
            style: isDark
                ? AppStyles.salesOverviewSubtitleDark
                : AppStyles.salesOverviewSubtitleLight,
          ),
          SizedBox(height: 10.h),
          SizedBox(
            height: 150.h,
            width: double.infinity,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                SalesChart(
                  data: chartData,
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Align(
                    alignment: const Alignment(0.15, 0),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: theme.primaryColor,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Text(
                        '${l10n.currencyEgp} 3.4k',
                        style: isDark
                            ? AppStyles.chartPeakBubbleDark
                            : AppStyles.chartPeakBubbleLight,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
