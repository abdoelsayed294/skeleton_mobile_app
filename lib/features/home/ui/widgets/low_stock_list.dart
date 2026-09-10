import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/features/home/ui/widgets/stock_item.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class LowStockList extends StatelessWidget {
  const LowStockList({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final items = [
      (l10n.refinedSugar, 3, 0.16, false),
      (l10n.tomatoPaste, 5, 0.25, false),
      (l10n.redLentils, 12, 0.55, true),
      (l10n.liptonTea, 12, 0.55, true),
    ];

    return Column(
      children: [
        Row(
          children: [
            Text(
              l10n.lowStock,
              style: isDark
                  ? AppStyles.stockTitleDark
                  : AppStyles.stockTitleLight,
            ),
            SizedBox(width: 8.w),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.h),
              decoration: BoxDecoration(
                color: (isDark ? AppColorsDark.error : AppColorsLight.error)
                    .withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(
                  color: (isDark ? AppColorsDark.error : AppColorsLight.error)
                      .withValues(alpha: 0.25),
                ),
              ),
              child: Text(
                '4 ${l10n.items}',
                style: isDark
                    ? AppStyles.stockBadgeDark
                    : AppStyles.stockBadgeLight,
              ),
            ),
            const Spacer(),
            Text(
              l10n.manage,
              style:
                  (isDark
                          ? AppStyles.stockStatusDark
                          : AppStyles.stockStatusLight)
                      .copyWith(color: Theme.of(context).primaryColor),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        ...items.map(
          (item) => StockItem(
            name: item.$1,
            count: item.$2,
            progress: item.$3,
            warning: !item.$4,
            isDark: isDark,
            l10n: l10n,
          ),
        ),
      ],
    );
  }
}
