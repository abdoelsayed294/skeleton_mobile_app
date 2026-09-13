import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/features/home/ui/widgets/sales_period_selector.dart';
import 'package:skeleton_mobile_app/features/home/ui/widgets/section_card.dart';

class ProductSalesHistoryCard extends StatefulWidget {
  final String totalUnits;
  final String changePercent;
  final List<String> dayLabels;
  final List<double> dayValues;

  const ProductSalesHistoryCard({
    super.key,
    required this.totalUnits,
    required this.changePercent,
    required this.dayLabels,
    required this.dayValues,
  });

  @override
  State<ProductSalesHistoryCard> createState() => _ProductSalesHistoryCardState();
}

class _ProductSalesHistoryCardState extends State<ProductSalesHistoryCard> {
  int selectedPeriod = 0;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final successColor = isDark ? AppColorsDark.success : AppColorsLight.success;
    final peakIndex = widget.dayValues.indexOf(
      widget.dayValues.reduce((a, b) => a > b ? a : b),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'SALES HISTORY',
              style: isDark ? AppStyles.statTitleDark : AppStyles.statTitleLight,
            ),
            const Spacer(),
            SalesPeriodSelector(
              selectedPeriod: selectedPeriod,
              labels: const ['Week', 'Month', 'Year'],
              onChanged: (period) => setState(() => selectedPeriod = period),
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
                      widget.totalUnits,
                      style: isDark ? AppStyles.stockTitleDark : AppStyles.stockTitleLight,
                    ),
                    SizedBox(width: 6.w),
                    Padding(
                      padding: EdgeInsets.only(bottom: 3.h),
                      child: Text(
                        'units this week',
                        style: isDark
                            ? AppStyles.font12MediumDark
                            : AppStyles.font12MediumLight,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                      decoration: BoxDecoration(
                        color: successColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Text(
                        '↑ ${widget.changePercent}',
                        style:
                            (isDark ? AppStyles.stockBadgeDark : AppStyles.stockBadgeLight)
                                .copyWith(color: successColor),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                SizedBox(
                  height: 100.h,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: List.generate(widget.dayValues.length, (index) {
                      final isPeak = index == peakIndex;
                      final barColor = isPeak
                          ? (isDark ? AppColorsDark.warningAlt : AppColorsLight.warning)
                          : (isDark ? AppColorsDark.warningAlt : AppColorsLight.warningAlt)
                              .withValues(alpha: 0.55);

                      return Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: FractionallySizedBox(
                                    heightFactor: widget.dayValues[index],
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: barColor,
                                        borderRadius: BorderRadius.circular(5.r),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 6.h),
                              Text(
                                widget.dayLabels[index],
                                style: (isDark
                                        ? AppStyles.salesChartLabelDark
                                        : AppStyles.salesChartLabelLight)
                                    .copyWith(
                                  color: isPeak ? barColor : null,
                                  fontWeight: isPeak ? FontWeight.w700 : null,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
