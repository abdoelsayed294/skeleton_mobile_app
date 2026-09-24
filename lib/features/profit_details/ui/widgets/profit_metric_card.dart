import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/features/profit_details/logic/profit_summary_cubit.dart';
import 'package:skeleton_mobile_app/features/profit_details/logic/profit_summary_state.dart';
import 'package:skeleton_mobile_app/features/profit_details/ui/widgets/profit_metric_shimmer.dart';

enum ProfitMetricType { grossProfit, margin, revenue, expenses }

class ProfitMetricCard extends StatelessWidget {
  final String label;
  final String unit;
  final Color accentColor;
  final IconData icon;
  final ProfitMetricType metricType;
  final bool isPercentage;

  const ProfitMetricCard({
    super.key,
    required this.label,
    required this.unit,
    required this.accentColor,
    required this.icon,
    required this.metricType,
    this.isPercentage = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfitSummaryCubit, ProfitSummaryState>(
      listener: (context, state) {},
      builder: (context, state) => state.maybeWhen(
        orElse: () => const SizedBox.shrink(),
        loading: () => const ProfitMetricShimmer(),
        success: (data) {
          final summary = data;
          final metric = switch (metricType) {
            ProfitMetricType.grossProfit => summary.grossProfit,
            ProfitMetricType.margin => summary.margin,
            ProfitMetricType.revenue => summary.revenue,
            ProfitMetricType.expenses => summary.expenses,
          };
          final value = metric?.value ?? 0;
          final formattedValue = isPercentage
              ? '${value.toStringAsFixed(1)}%'
              : value.toStringAsFixed(value % 1 == 0 ? 0 : 2);
          final change = metric?.percentChange ?? 0;
          final theme = Theme.of(context);
          final isDark = theme.brightness == Brightness.dark;

          return Expanded(
            child: Container(
              height: 112.h,
              padding: EdgeInsets.fromLTRB(12.w, 11.h, 12.w, 9.h),
              decoration: BoxDecoration(
                color: theme.cardColor,
                borderRadius: BorderRadius.circular(14.r),
                border: Border.all(color: theme.dividerColor),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 7.r,
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
                          label.toUpperCase(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: isDark
                              ? AppStyles.statTitleDark
                              : AppStyles.statTitleLight,
                        ),
                      ),
                      Icon(icon, size: 15.sp, color: accentColor),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  SizedBox(
                    width: double.infinity,
                    height: 27.h,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Directionality.of(context) == TextDirection.rtl
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: Text(
                          formattedValue,
                          maxLines: 1,
                          style: isDark
                              ? AppStyles.statValueDark
                              : AppStyles.statValueLight,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    unit,
                    style: isDark
                        ? AppStyles.statUnitDark
                        : AppStyles.statUnitLight,
                  ),
                  const Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 6.w,
                      vertical: 2.h,
                    ),
                    decoration: BoxDecoration(
                      color: accentColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(7.r),
                    ),
                    child: Text(
                      '${change >= 0 ? '+' : ''}${change.toStringAsFixed(1)}%',
                      style:
                          (isDark
                                  ? AppStyles.statChangeDark
                                  : AppStyles.statChangeLight)
                              .copyWith(color: accentColor),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        error: (_) => const SizedBox.shrink(),
      ),
    );
  }
}
