import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class ProductRow extends StatelessWidget {
  final int rank;
  final String title;
  final String subtitle;
  final String price;
  final IconData icon;
  final Color accentColor;
  final bool isDark;
  final bool isLast;

  const ProductRow({
    super.key,
    required this.rank,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.icon,
    required this.accentColor,
    required this.isDark,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h),
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
        children: [
          SizedBox(
            width: 20.w,
            child: Text(
              '0$rank',
              style:
                  (isDark
                          ? AppStyles.productSubtitleDark
                          : AppStyles.productSubtitleLight)
                      .copyWith(color: theme.textTheme.bodySmall?.color),
            ),
          ),
          Container(
            width: 30.w,
            height: 30.w,
            decoration: BoxDecoration(
              color: accentColor.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: accentColor.withValues(alpha: 0.16)),
            ),
            child: Icon(icon, size: 17.sp, color: accentColor),
          ),
          SizedBox(width: 8.w),
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
                  subtitle,
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
                price,
                style: isDark
                    ? AppStyles.productPriceDark
                    : AppStyles.productPriceLight,
              ),
              Text(
                AppLocalizations.of(context)!.currencyEgp,
                style: isDark
                    ? AppStyles.productSubtitleDark
                    : AppStyles.productSubtitleLight,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
