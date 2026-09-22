import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/helpers/shared_pref_helper.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';
import 'package:skeleton_mobile_app/features/home/logic/home_cubit.dart';
import 'package:skeleton_mobile_app/features/home/logic/home_state.dart';
import 'package:skeleton_mobile_app/features/home/ui/widgets/sales_chart.dart';
import 'package:skeleton_mobile_app/features/home/ui/widgets/sales_period_selector.dart';

class SalesOverview extends StatefulWidget {
  final DateTime selectedDate;

  const SalesOverview({super.key, required this.selectedDate});

  @override
  State<SalesOverview> createState() => _SalesOverviewState();
}

class _SalesOverviewState extends State<SalesOverview> {
  int selectedPeriod = 0;

  @override
  void initState() {
    super.initState();
    _getSalesChart();
  }

  @override
  void didUpdateWidget(SalesOverview oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedDate != widget.selectedDate) {
      _getSalesChart();
    }
  }

  Future<void> _getSalesChart() async {
    final storeId = await SharedPrefHelper.getInt(
      SharedPrefHelper.storeIdKey,
    );

    if (!mounted) return;

    context.read<HomeCubit>().getSalesChart(
      storeId: storeId,
      period: 'today',
      days: 1,
    );
  }

  Future<void> _changePeriod(int period) async {
    setState(() {
      selectedPeriod = period;
    });

    final storeId = await SharedPrefHelper.getInt(
      SharedPrefHelper.storeIdKey,
    );

    if (!mounted) return;

    if (period == 0) {
      context.read<HomeCubit>().getSalesChart(
        storeId: storeId,
        period: 'today',
        days: 1,
      );
    } else if (period == 1) {
      context.read<HomeCubit>().getSalesChart(
        storeId: storeId,
        period: 'week',
        days: 7,
      );
    } else {
      context.read<HomeCubit>().getSalesChart(
        storeId: storeId,
        period: 'month',
        days: 30,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;

    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        final salesResponse = state.salesChartState.maybeWhen(
          success: (data) => data,
          orElse: () => null,
        );

        final salesData = salesResponse?.chart ?? [];

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
                    labels: [
                      l10n.today,
                      l10n.week,
                      l10n.month,
                    ],
                    onChanged: _changePeriod,
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
                          text: (salesResponse?.total ?? 0)
                              .toStringAsFixed(0),
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
                        '${salesResponse?.changePct.toStringAsFixed(0) ?? '0'}%',
                        style: isDark
                            ? AppStyles.salesOverviewPercentDark
                            : AppStyles.salesOverviewPercentLight,
                      ),
                      Text(
                        salesResponse?.vsLabel ?? l10n.vsYesterday,
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
                data: salesData,
              ),
            ],
          ),
        );
      },
    );
  }
}