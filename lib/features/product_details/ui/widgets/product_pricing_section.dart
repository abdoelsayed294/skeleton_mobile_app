import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:skeleton_mobile_app/core/helpers/spacing.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/core/widgets/dilaog_utils.dart';
import 'package:skeleton_mobile_app/features/product_details/logic/product_pricing_cubit.dart';
import 'package:skeleton_mobile_app/features/product_details/logic/product_pricing_state.dart';
import 'package:skeleton_mobile_app/features/product_details/ui/widgets/price_tile.dart';
import 'package:skeleton_mobile_app/features/product_details/ui/widgets/product_details_section_shimmer.dart';
import 'package:skeleton_mobile_app/features/product_details/ui/widgets/profile_tile.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class ProductPricingSection extends StatelessWidget {
  const ProductPricingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).toLanguageTag();
    final successColor = isDark
        ? AppColorsDark.success
        : AppColorsLight.success;

    return BlocConsumer<ProductPricingCubit, ProductPricingState>(
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
        initial: () => const ProductDetailsSectionShimmer(height: 205),
        loading: () => const ProductDetailsSectionShimmer(height: 205),
        success: (data) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'PRICING',
                  style: isDark
                      ? AppStyles.statTitleDark
                      : AppStyles.statTitleLight,
                ),
                const Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                  decoration: BoxDecoration(
                    color: successColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    data.marginLabel,
                    style:
                        (isDark
                                ? AppStyles.stockBadgeDark
                                : AppStyles.stockBadgeLight)
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
                    value:
                        'EGP ${NumberFormat('#,##0.##', locale).format(data.purchasePrice)}',
                    icon: Icons.shopping_cart_outlined,
                    iconColor: isDark
                        ? AppColorsDark.primary
                        : AppColorsLight.primary,
                  ),
                ),
                horizontalSpace(10),
                Expanded(
                  child: PriceTile(
                    label: 'Selling Price',
                    value:
                        'EGP ${NumberFormat('#,##0.##', locale).format(data.sellingPrice)}',
                    icon: Icons.sell_outlined,
                    iconColor: isDark
                        ? AppColorsDark.warningAlt
                        : AppColorsLight.warningAlt,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Expanded(
                  child: ProfitTile(
                    label: 'Profit / Unit',
                    value:
                        'EGP ${NumberFormat('#,##0.##', locale).format(data.profitPerUnit)}',
                  ),
                ),
                horizontalSpace(10),
                Expanded(
                  child: ProfitTile(
                    label: 'Profit Margin',
                    value:
                        '${NumberFormat('#,##0.##', locale).format(data.profitMargin)}%',
                  ),
                ),
              ],
            ),
          ],
        ),
        orElse: () => const SizedBox.shrink(),
      ),
    );
  }
}
