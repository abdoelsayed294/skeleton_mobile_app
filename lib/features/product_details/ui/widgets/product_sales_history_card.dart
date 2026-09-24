import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/core/widgets/dilaog_utils.dart';
import 'package:skeleton_mobile_app/features/home/ui/widgets/sales_period_selector.dart';
import 'package:skeleton_mobile_app/features/home/ui/widgets/section_card.dart';
import 'package:skeleton_mobile_app/features/product_details/logic/product_sales_history_cubit.dart';
import 'package:skeleton_mobile_app/features/product_details/logic/product_sales_history_state.dart';
import 'package:skeleton_mobile_app/features/product_details/ui/widgets/product_details_section_shimmer.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class ProductSalesHistoryCard extends StatelessWidget {
  const ProductSalesHistoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;
    final successColor = isDark
        ? AppColorsDark.success
        : AppColorsLight.success;
    final cubit = context.read<ProductSalesHistoryCubit>();

    return BlocConsumer<ProductSalesHistoryCubit, ProductSalesHistoryState>(
      listener: (context, state) {
        state.maybeWhen(
          error: (error) => DialogUtils.showMessage(
            context: context,
            type: DialogType.error,
            title: l10n.errorTitle,
            message: error.error?.message ?? l10n.genericError,
          ),
          orElse: () {},
        );
      },
      builder: (context, state) => state.maybeWhen(
        initial: () => const ProductDetailsSectionShimmer(height: 210),
        loading: () => const ProductDetailsSectionShimmer(height: 210),
        success: (data) {
          final maxUnits = data.chart.fold<int>(
            0,
            (maximum, point) => math.max(maximum, point.units),
          );
          final peakIndex = data.chart.isEmpty
              ? -1
              : data.chart.indexWhere((point) => point.units == maxUnits);
          final selectedPeriod = switch (cubit.selectedPeriod) {
            'month' => 1,
            'year' => 2,
            _ => 0,
          };
          final periodLabel = switch (data.period) {
            'month' => l10n.month,
            'year' => l10n.year,
            _ => l10n.week,
          };

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'SALES HISTORY',
                    style: isDark
                        ? AppStyles.statTitleDark
                        : AppStyles.statTitleLight,
                  ),
                  const Spacer(),
                  SalesPeriodSelector(
                    selectedPeriod: selectedPeriod,
                    labels: [l10n.week, l10n.month, l10n.year],
                    onChanged: (period) => cubit.changePeriod(switch (period) {
                      1 => 'month',
                      2 => 'year',
                      _ => 'week',
                    }),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              SectionCard(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '${data.totalUnits}',
                            style: isDark
                                ? AppStyles.stockTitleDark
                                : AppStyles.stockTitleLight,
                          ),
                          SizedBox(width: 6.w),
                          Padding(
                            padding: EdgeInsets.only(bottom: 3.h),
                            child: Text(
                              l10n.unitsSold,
                              style: isDark
                                  ? AppStyles.font12MediumDark
                                  : AppStyles.font12MediumLight,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 3.h,
                            ),
                            decoration: BoxDecoration(
                              color: successColor.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Text(
                              data.vsLabel.isNotEmpty
                                  ? data.vsLabel
                                  : '${data.changePct}%',
                              style:
                                  (isDark
                                          ? AppStyles.stockBadgeDark
                                          : AppStyles.stockBadgeLight)
                                      .copyWith(color: successColor),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      if (data.chart.isEmpty)
                        SizedBox(
                          height: 100.h,
                          child: const Center(child: Text('No sales history')),
                        )
                      else
                        SizedBox(
                          height: 100.h,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: List.generate(data.chart.length, (index) {
                              final point = data.chart[index];
                              final isPeak = index == peakIndex;
                              final barColor = isPeak
                                  ? (isDark
                                        ? AppColorsDark.warningAlt
                                        : AppColorsLight.warning)
                                  : (isDark
                                            ? AppColorsDark.warningAlt
                                            : AppColorsLight.warningAlt)
                                        .withValues(alpha: 0.55);
                              final heightFactor = maxUnits == 0
                                  ? 0.04
                                  : point.units / maxUnits;

                              return Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 4.w,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.bottomCenter,
                                          child: FractionallySizedBox(
                                            heightFactor: heightFactor,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: barColor,
                                                borderRadius:
                                                    BorderRadius.circular(5.r),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 6.h),
                                      Text(
                                        point.label,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style:
                                            (isDark
                                                    ? AppStyles
                                                          .salesChartLabelDark
                                                    : AppStyles
                                                          .salesChartLabelLight)
                                                .copyWith(
                                                  color: isPeak
                                                      ? barColor
                                                      : null,
                                                  fontWeight: isPeak
                                                      ? FontWeight.w700
                                                      : null,
                                                ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      SizedBox(height: 4.h),
                      Text(
                        periodLabel,
                        style: isDark
                            ? AppStyles.font12MediumDark
                            : AppStyles.font12MediumLight,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
        orElse: () => const SizedBox.shrink(),
      ),
    );
  }
}
