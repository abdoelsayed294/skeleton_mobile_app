import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/helpers/spacing.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/features/product_details/ui/widgets/price_tile.dart';
import 'package:skeleton_mobile_app/features/product_details/ui/widgets/profile_tile.dart';

class ProductPricingSection extends StatelessWidget {
  final String purchasePrice;
  final String sellingPrice;
  final String profitPerUnit;
  final String profitMargin;
  final String marginChange;

  const ProductPricingSection({
    super.key,
    required this.purchasePrice,
    required this.sellingPrice,
    required this.profitPerUnit,
    required this.profitMargin,
    required this.marginChange,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final successColor = isDark ? AppColorsDark.success : AppColorsLight.success;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'PRICING',
              style: isDark ? AppStyles.statTitleDark : AppStyles.statTitleLight,
            ),
            const Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
              decoration: BoxDecoration(
                color: successColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Text(
                '↑ $marginChange margin',
                style: (isDark ? AppStyles.stockBadgeDark : AppStyles.stockBadgeLight)
                    .copyWith(color: successColor),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            Expanded(
              child: PriceTile(
                label: 'Purchase Price',
                value: purchasePrice,
                icon: Icons.shopping_cart_outlined,
                iconColor: isDark ? AppColorsDark.primary : AppColorsLight.primary,
              ),
            ),
            horizontalSpace(10),
            Expanded(
              child: PriceTile(
                label: 'Selling Price',
                value: sellingPrice,
                icon: Icons.sell_outlined,
                iconColor: isDark ? AppColorsDark.warningAlt : AppColorsLight.warningAlt,
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            Expanded(
              child: ProfitTile(label: 'Profit / Unit', value: profitPerUnit),
            ),
            horizontalSpace(10),
            Expanded(
              child: ProfitTile(label: 'Profit Margin', value: '$profitMargin %'),
            ),
          ],
        ),
      ],
    );
  }
}

