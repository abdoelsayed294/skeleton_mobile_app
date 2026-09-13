import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/features/reports/ui/widgets/stat_column.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class TotalSalesCard extends StatelessWidget {
  final String totalAmount;
  final String changePercent;
  final String orders;
  final String avgOrder;
  final String customers;

  const TotalSalesCard({
    super.key,
    this.totalAmount = '84,320',
    this.changePercent = '+18.4%',
    this.orders = '1,247',
    this.avgOrder = '67.6',
    this.customers = '834',
  });

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
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                totalAmount,
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
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.14),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.trending_up_rounded,
                      size: 12.sp,
                      color: Colors.white,
                    ),
                    SizedBox(width: 3.w),
                    Text(
                      changePercent,
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
          Container(height: 1, color: Colors.white.withValues(alpha: 0.1)),
          SizedBox(height: 14.h),
          Row(
            children: [
              Expanded(
                child: StatColumn(
                  label: l10n.ordersLabel,
                  value: orders,
                  isDark: isDark,
                ),
              ),
              Expanded(
                child: StatColumn(
                  label: l10n.avgOrder,
                  value: '${l10n.currencyEgp} $avgOrder',
                  isDark: isDark,
                ),
              ),
              Expanded(
                child: StatColumn(
                  label: l10n.customers,
                  value: customers,
                  isDark: isDark,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

