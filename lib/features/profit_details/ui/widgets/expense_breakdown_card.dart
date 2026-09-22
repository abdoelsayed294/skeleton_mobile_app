import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/features/profit_details/ui/widgets/expense_donut_painter.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class ExpenseBreakdownCard extends StatelessWidget {
  const ExpenseBreakdownCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;
    final colors = [
      isDark ? AppColorsDark.primary : AppColorsLight.primary,
      isDark ? AppColorsDark.warning : AppColorsLight.warning,
      isDark ? AppColorsDark.accentPurple : AppColorsLight.accentPurple,
      isDark ? AppColorsDark.error : AppColorsLight.error,
    ];
    final items = [
      (l10n.cogs, '3,376', '58%', colors[0]),
      (l10n.operations, '1,164', '20%', colors[1]),
      (l10n.salaries, '815', '14%', colors[2]),
      (l10n.categoryOther, '465', '8%', colors[3]),
    ];

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
                        values: const [0.58, 0.20, 0.14, 0.08],
                        colors: colors,
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '5,820',
                          style:
                              (isDark
                                      ? AppStyles.salesBreakdownBigNumberDark
                                      : AppStyles.salesBreakdownBigNumberLight)
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
                  children: items
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
                                  borderRadius: BorderRadius.circular(2.r),
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
                                crossAxisAlignment: CrossAxisAlignment.end,
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
  }
}
