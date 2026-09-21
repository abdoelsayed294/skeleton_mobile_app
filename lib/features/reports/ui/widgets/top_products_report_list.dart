import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/features/home/ui/widgets/section_card.dart';
import 'package:skeleton_mobile_app/features/reports/ui/widgets/top_product_row.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class TopProductsReportList extends StatelessWidget {
  const TopProductsReportList({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final products = [
      (l10n.productLiptonTea, '342', '9,804', '+12%', true),
      (l10n.productBaladiBread, '289', '7,225', '+8%', true),
      (l10n.productSunflowerOilHayat, '201', '6,432', '-3%', false),
      (l10n.productHalawaExtraFine, '178', '5,340', '+21%', true),
      (l10n.productSafiWater, '154', '4,620', '+5%', true),
    ];

    return SectionCard(
      child: Padding(
        padding: EdgeInsets.only(bottom: 6.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    l10n.topSellingProducts,
                    style: isDark
                        ? AppStyles.productTitleDark
                        : AppStyles.productTitleLight,
                  ),
                ),
                Text(
                  l10n.seeAll,
                  style: (isDark
                          ? AppStyles.productSubtitleDark
                          : AppStyles.productSubtitleLight)
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
              ],
            ),
            SizedBox(height: 6.h),
            ...List.generate(products.length, (index) {
              final product = products[index];
              return TopProductRow(
                rank: index + 1,
                title: product.$1,
                unitsSold: product.$2,
                price: product.$3,
                change: product.$4,
                isPositive: product.$5,
                isDark: isDark,
                isLast: index == products.length - 1,
              );
            }),
          ],
        ),
      ),
    );
  }
}

