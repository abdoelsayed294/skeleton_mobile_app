import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/features/inventory/ui/widgets/inventory_product_tile.dart';
import 'package:skeleton_mobile_app/features/inventory/ui/widgets/inventory_stats.dart';
import 'package:skeleton_mobile_app/features/inventory/ui/widgets/stock_status.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class InventoryProductList extends StatelessWidget {
  const InventoryProductList({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;
    final products = [
      (
        l10n.pitaBreadBundle,
        l10n.drinksCategory,
        '4',
        '10',
        '20.00',
        StockStatus.low,
        Icons.bakery_dining_outlined,
      ),
      (
        l10n.sunflowerCookingOil,
        l10n.drinksCategory,
        '0',
        '12',
        '18.00',
        StockStatus.out,
        Icons.opacity_outlined,
      ),
      (
        l10n.egyptianWhiteRice,
        l10n.drinksCategory,
        '32',
        '20',
        '8.00',
        StockStatus.inStock,
        Icons.grain_outlined,
      ),
      (
        l10n.refinedSugar,
        l10n.snacksCategory,
        '6',
        '10',
        '15.00',
        StockStatus.low,
        Icons.cookie_outlined,
      ),
      (
        l10n.tomatoPaste,
        l10n.groceryCategory,
        '22',
        '10',
        '12.00',
        StockStatus.inStock,
        Icons.lunch_dining_outlined,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InventoryStats(l10n: l10n),
        SizedBox(height: 22.h),
        Row(
          children: [
            Text(
              l10n.allProducts.toUpperCase(),
              style:
                  (isDark
                          ? AppStyles.font18BoldDark
                          : AppStyles.font18BoldLight)
                      .copyWith(fontSize: 13.sp),
            ),
            SizedBox(width: 8.w),
            Text(
              '· 48',
              style:
                  (isDark
                          ? AppStyles.font12MediumDark
                          : AppStyles.font12MediumLight)
                      .copyWith(fontWeight: FontWeight.w700),
            ),
            const Spacer(),
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(8.r),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 2.w),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.swap_vert_rounded,
                      size: 17.sp,
                      color: Theme.of(context).primaryColor,
                    ),
                    SizedBox(width: 3.w),
                    Text(
                      l10n.sort,
                      style:
                          (isDark
                                  ? AppStyles.font12MediumDark
                                  : AppStyles.font12MediumLight)
                              .copyWith(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w700,
                              ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        ...products.asMap().entries.map(
          (entry) => InventoryProductTile(
            name: entry.value.$1,
            category: entry.value.$2,
            quantity: entry.value.$3,
            minimum: entry.value.$4,
            price: entry.value.$5,
            status: entry.value.$6,
            icon: entry.value.$7,
            isLast: entry.key == products.length - 1,
          ),
        ),
      ],
    );
  }
}
