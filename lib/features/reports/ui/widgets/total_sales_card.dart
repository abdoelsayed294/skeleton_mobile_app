import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/helpers/shared_pref_helper.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/core/widgets/shimmer_block.dart';
import 'package:skeleton_mobile_app/features/reports/logic/reports_sales_cubit.dart';
import 'package:skeleton_mobile_app/features/reports/logic/reports_sales_state.dart';
import 'package:skeleton_mobile_app/features/reports/ui/widgets/stat_column.dart';
import 'package:skeleton_mobile_app/features/reports/ui/widgets/reports_daily_sales_chart.dart';
import 'package:skeleton_mobile_app/features/reports/ui/widgets/reports_payment_breakdown.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class TotalSalesCard extends StatefulWidget {
  final DateTime selectedMonth;

  const TotalSalesCard({super.key, required this.selectedMonth});

  @override
  State<TotalSalesCard> createState() => _TotalSalesCardState();
}

class _TotalSalesCardState extends State<TotalSalesCard> {
  @override
  void initState() {
    super.initState();
    _fetchReportsSales();
  }

  @override
  void didUpdateWidget(covariant TotalSalesCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedMonth.year != widget.selectedMonth.year ||
        oldWidget.selectedMonth.month != widget.selectedMonth.month) {
      _fetchReportsSales();
    }
  }

  Future<void> _fetchReportsSales() async {
    final storeId = await SharedPrefHelper.getInt(SharedPrefHelper.storeIdKey);
    if (!mounted) return;
    context.read<ReportsSalesCubit>().getReportsSales(
      storeId: storeId,
      period: 'month',
      year: widget.selectedMonth.year,
      month: widget.selectedMonth.month,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;
    final cardColor = isDark
        ? AppColorsDark.heroCardBackground
        : AppColorsLight.heroCardBackground;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(18.w, 18.h, 18.w, 16.h),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.22),
            blurRadius: 16.r,
            offset: Offset(0, 8.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.totalSales.toUpperCase(),
            style: isDark
                ? AppStyles.totalSalesLabelDark
                : AppStyles.totalSalesLabelLight,
          ),
          SizedBox(height: 8.h),
          BlocBuilder<ReportsSalesCubit, ReportsSalesState>(
            builder: (context, state) {
              return state.when(
                initial: () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerBlock(width: 155.w, height: 34.h),
                    SizedBox(height: 12.h),
                    ShimmerBlock(width: 130.w, height: 22.h, radius: 14),
                    SizedBox(height: 16.h),
                    Container(
                      height: 1,
                      color: Colors.white.withValues(alpha: 0.1),
                    ),
                    SizedBox(height: 14.h),
                    Row(
                      children: List.generate(
                        3,
                        (index) => Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ShimmerBlock(width: 45.w, height: 10.h),
                              SizedBox(height: 8.h),
                              ShimmerBlock(width: 55.w, height: 15.h),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                loading: () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerBlock(width: 155.w, height: 34.h),
                    SizedBox(height: 12.h),
                    ShimmerBlock(width: 130.w, height: 22.h, radius: 14),
                    SizedBox(height: 16.h),
                    Container(
                      height: 1,
                      color: Colors.white.withValues(alpha: 0.1),
                    ),
                    SizedBox(height: 14.h),
                    Row(
                      children: List.generate(
                        3,
                        (index) => Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ShimmerBlock(width: 45.w, height: 10.h),
                              SizedBox(height: 8.h),
                              ShimmerBlock(width: 55.w, height: 15.h),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                success: (data) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            data.totalSales.toStringAsFixed(0),
                            style: isDark
                                ? AppStyles.totalSalesAmountDark
                                : AppStyles.totalSalesAmountLight,
                          ),
                          SizedBox(width: 6.w),
                          Text(
                            l10n.currencyEgp,
                            style: isDark
                                ? AppStyles.totalSalesUnitDark
                                : AppStyles.totalSalesUnitLight,
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 4.h,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.14),
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  data.salesChangePct >= 0
                                      ? Icons.trending_up_rounded
                                      : Icons.trending_down_rounded,
                                  size: 12.sp,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 3.w),
                                Text(
                                  '${data.salesChangePct >= 0 ? '+' : ''}${data.salesChangePct.toStringAsFixed(1)}%',
                                  style: isDark
                                      ? AppStyles.totalSalesChangeDark
                                      : AppStyles.totalSalesChangeLight,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Expanded(
                            child: Text(
                              l10n.comparedToLastMonth,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: isDark
                                  ? AppStyles.totalSalesCompareDark
                                  : AppStyles.totalSalesCompareLight,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      Container(
                        height: 1,
                        color: Colors.white.withValues(alpha: 0.1),
                      ),
                      SizedBox(height: 14.h),
                      Row(
                        children: [
                          Expanded(
                            child: StatColumn(
                              label: l10n.ordersLabel,
                              value: data.orders.toString(),
                              isDark: isDark,
                            ),
                          ),
                          Expanded(
                            child: StatColumn(
                              label: l10n.avgOrder,
                              value:
                                  '${l10n.currencyEgp} ${data.avgOrder.toStringAsFixed(1)}',
                              isDark: isDark,
                            ),
                          ),
                          Expanded(
                            child: StatColumn(
                              label: l10n.customers,
                              value: data.customers.toString(),
                              isDark: isDark,
                            ),
                          ),
                        ],
                      ),
                      if (data.daily.isNotEmpty) ...[
                        SizedBox(height: 18.h),
                        ReportsDailySalesChart(points: data.daily),
                      ],
                      if (data.breakdown.isNotEmpty) ...[
                        SizedBox(height: 14.h),
                        ReportsPaymentBreakdown(items: data.breakdown),
                      ],
                    ],
                  );
                },
                error: (error) => Center(
                  child: Text(
                    error.error?.message ?? 'Error',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
