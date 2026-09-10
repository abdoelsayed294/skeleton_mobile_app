import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';
import 'package:skeleton_mobile_app/features/home/ui/widgets/sales_chart.dart';
import 'package:skeleton_mobile_app/features/home/ui/widgets/sales_period_selector.dart';

class SalesOverview extends StatefulWidget {
  const SalesOverview({super.key});

  @override
  State<SalesOverview> createState() => _SalesOverviewState();
}

class _SalesOverviewState extends State<SalesOverview> {
  int selectedPeriod = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;

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
            color: Colors.black.withValues(alpha: isDark ? 0.14 : 0.04),
            blurRadius: 8.r,
            offset: Offset(0, 3.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  l10n.salesOverview,
                  style: isDark
                      ? AppStyles.salesOverviewTitleDark
                      : AppStyles.salesOverviewTitleLight,
                ),
              ),
              SalesPeriodSelector(
                selectedPeriod: selectedPeriod,
                labels: [l10n.today, l10n.week, l10n.month],
                onChanged: (period) => setState(() => selectedPeriod = period),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Text(
            l10n.revenueOverTime,
            style: isDark
                ? AppStyles.salesOverviewSubtitleDark
                : AppStyles.salesOverviewSubtitleLight,
          ),
          SizedBox(height: 14.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  style: isDark
                      ? AppStyles.salesOverviewSubtitleDark
                      : AppStyles.salesOverviewSubtitleLight,
                  children: [
                    TextSpan(
                      text: '${l10n.currencyEgp} ',
                      style: isDark
                          ? AppStyles.salesOverviewCurrencyDark
                          : AppStyles.salesOverviewCurrencyLight,
                    ),
                    TextSpan(
                      text: '12,450',
                      style: isDark
                          ? AppStyles.salesOverviewAmountDark
                          : AppStyles.salesOverviewAmountLight,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '+12.5%',
                    style: isDark
                        ? AppStyles.salesOverviewPercentDark
                        : AppStyles.salesOverviewPercentLight,
                  ),
                  Text(
                    l10n.vsYesterday,
                    style: isDark
                        ? AppStyles.salesOverviewMetaDark
                        : AppStyles.salesOverviewMetaLight,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10.h),
          SalesChart(
            timeLabels: [
              l10n.chartTime8Am,
              l10n.chartTime10Am,
              l10n.chartTime12Pm,
              l10n.chartTime2Pm,
              l10n.chartTime4Pm,
              l10n.chartTime6Pm,
            ],
          ),
        ],
      ),
    );
  }
}
