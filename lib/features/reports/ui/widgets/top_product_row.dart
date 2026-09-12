import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class TopProductRow extends StatelessWidget {
  final int rank;
  final String title;
  final String unitsSold;
  final String price;
  final String change;
  final bool isPositive;
  final bool isDark;
  final bool isLast;

  const TopProductRow({
    required this.rank,
    required this.title,
    required this.unitsSold,
    required this.price,
    required this.change,
    required this.isPositive,
    required this.isDark,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final changeColor = isPositive
        ? (isDark ? AppColorsDark.success : AppColorsLight.success)
        : (isDark ? AppColorsDark.error : AppColorsLight.error);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 9.h),
      decoration: isLast
          ? null
          : BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: theme.dividerColor.withValues(alpha: 0.45),
                ),
              ),
            ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 18.w,
            child: Text(
              '$rank',
              style: isDark
                  ? AppStyles.topProductRankDark
                  : AppStyles.topProductRankLight,
            ),
          ),
          SizedBox(width: 6.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: isDark
                      ? AppStyles.productTitleDark
                      : AppStyles.productTitleLight,
                ),
                Text(
                  '$unitsSold ${l10n.unitsSold}',
                  style: isDark
                      ? AppStyles.productSubtitleDark
                      : AppStyles.productSubtitleLight,
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${l10n.currencyEgp} $price',
                style: isDark
                    ? AppStyles.topProductPriceDark
                    : AppStyles.topProductPriceLight,
              ),
              SizedBox(height: 3.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: changeColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Text(
                  change,
                  style:
                      (isDark
                              ? AppStyles.topProductChangeDark
                              : AppStyles.topProductChangeLight)
                          .copyWith(color: changeColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
