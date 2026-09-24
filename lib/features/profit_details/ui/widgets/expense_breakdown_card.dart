import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/features/profit_details/logic/profit_summary_cubit.dart';
import 'package:skeleton_mobile_app/features/profit_details/logic/profit_summary_state.dart';
import 'package:skeleton_mobile_app/features/profit_details/ui/widgets/expense_donut_painter.dart';
import 'package:skeleton_mobile_app/features/profit_details/ui/widgets/profit_section_shimmer.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class ExpenseBreakdownCard extends StatelessWidget {
  const ExpenseBreakdownCard({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BlocConsumer<ProfitSummaryCubit, ProfitSummaryState>(
      listener: (context, state) {},
      builder: (context, state) => state.maybeWhen(
        orElse: () => const SizedBox.shrink(),
        loading: () => const ProfitSectionShimmer(height: 220),
        success: (data) {
          final items = data.expenseBreakdown;
          final isDark = Theme.of(context).brightness == Brightness.dark;
          final colors = [
            isDark ? AppColorsDark.primary : AppColorsLight.primary,
            isDark ? AppColorsDark.warning : AppColorsLight.warning,
            isDark ? AppColorsDark.accentPurple : AppColorsLight.accentPurple,
            isDark ? AppColorsDark.error : AppColorsLight.error,
          ];
          final firstVisibleItemIndex = items.length > 5 ? items.length - 5 : 0;
          final rows = items
              .asMap()
              .entries
              .skip(firstVisibleItemIndex)
              .map(
                (entry) => (
                  entry.value.category ?? '',
                  entry.value.total.toStringAsFixed(0),
                  '${entry.value.percent.toStringAsFixed(0)}%',
                  colors[entry.key % colors.length],
                ),
              )
              .toList();
          final chartValues = items.map((item) => item.percent / 100).toList();
          final total = items.fold<double>(0, (sum, item) => sum + item.total);

          return Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(18.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10.r,
                  offset: Offset(0, 4.h),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.expenseBreakdown,
                  style: isDark
                      ? AppStyles.productTitleDark
                      : AppStyles.productTitleLight,
                ),
                SizedBox(height: 3.h),
                Text(
                  l10n.moneyWentToday,
                  style: isDark
                      ? AppStyles.productSubtitleDark
                      : AppStyles.productSubtitleLight,
                ),
                SizedBox(height: 14.h),
                Row(
                  children: [
                    SizedBox(
                      width: 134.w,
                      height: 134.w,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CustomPaint(
                            size: Size.square(134.w),
                            painter: ExpenseDonutPainter(
                              values: chartValues,
                              colors: colors,
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                total.toStringAsFixed(0),
                                style:
                                    (isDark
                                            ? AppStyles
                                                  .salesBreakdownBigNumberDark
                                            : AppStyles
                                                  .salesBreakdownBigNumberLight)
                                        .copyWith(fontSize: 16),
                              ),
                              Text(
                                l10n.currencyEgp,
                                style: isDark
                                    ? AppStyles.salesBreakdownBigLabelDark
                                    : AppStyles.salesBreakdownBigLabelLight,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 14.w),
                    Expanded(
                      child: Column(
                        children: rows
                            .map(
                              (item) => Padding(
                                padding: EdgeInsets.only(bottom: 10.h),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 8.w,
                                      height: 8.w,
                                      decoration: BoxDecoration(
                                        color: item.$4,
                                        borderRadius: BorderRadius.circular(
                                          2.r,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 7.w),
                                    Expanded(
                                      child: Text(
                                        item.$1,
                                        style: isDark
                                            ? AppStyles.paymentLegendLabelDark
                                            : AppStyles.paymentLegendLabelLight,
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          item.$2,
                                          style: isDark
                                              ? AppStyles.topProductPriceDark
                                              : AppStyles.topProductPriceLight,
                                        ),
                                        Text(
                                          item.$3,
                                          style: isDark
                                              ? AppStyles.txnMetaDark
                                              : AppStyles.txnMetaLight,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        error: (_) => const SizedBox.shrink(),
      ),
    );
  }
}
