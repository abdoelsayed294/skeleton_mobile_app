import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/core/widgets/dilaog_utils.dart';
import 'package:skeleton_mobile_app/features/home/ui/widgets/section_card.dart';
import 'package:skeleton_mobile_app/features/product_details/logic/product_inventory_cubit.dart';
import 'package:skeleton_mobile_app/features/product_details/logic/product_inventory_state.dart';
import 'package:skeleton_mobile_app/features/product_details/ui/widgets/product_details_section_shimmer.dart';
import 'package:skeleton_mobile_app/features/product_details/ui/widgets/sold_row.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class ProductInventorySection extends StatelessWidget {
  const ProductInventorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;
    final warningColor = isDark
        ? AppColorsDark.warningAlt
        : AppColorsLight.warning;
    final warningBg = isDark
        ? AppColorsDark.warningBorder
        : AppColorsLight.warningBg;

    return BlocConsumer<ProductInventoryCubit, ProductInventoryState>(
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
        initial: () => const ProductDetailsSectionShimmer(height: 270),
        loading: () => const ProductDetailsSectionShimmer(height: 270),
        success: (data) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'INVENTORY',
              style: isDark
                  ? AppStyles.statTitleDark
                  : AppStyles.statTitleLight,
            ),
            SizedBox(height: 10.h),
            Container(
              padding: EdgeInsets.all(14.w),
              decoration: BoxDecoration(
                color: warningBg.withValues(alpha: isDark ? 1 : 0.5),
                borderRadius: BorderRadius.circular(14.r),
                border: Border.all(color: warningColor.withValues(alpha: 0.35)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Current Stock',
                          style:
                              (isDark
                                      ? AppStyles.font12MediumDark
                                      : AppStyles.font12MediumLight)
                                  .copyWith(color: warningColor),
                        ),
                        SizedBox(height: 6.h),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '${data.currentStock}',
                              style: isDark
                                  ? AppStyles.stockTitleDark
                                  : AppStyles.stockTitleLight,
                            ),
                            SizedBox(width: 4.w),
                            Padding(
                              padding: EdgeInsets.only(bottom: 4.h),
                              child: Text(
                                'units',
                                style: isDark
                                    ? AppStyles.font12MediumDark
                                    : AppStyles.font12MediumLight,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'Minimum stock: ${data.minimumStockLevel}',
                          style: isDark
                              ? AppStyles.font12MediumDark
                              : AppStyles.font12MediumLight,
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    data.currentStock <= data.minimumStockLevel
                        ? Icons.warning_amber_rounded
                        : Icons.inventory_2_outlined,
                    size: 28.sp,
                    color: warningColor,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            SectionCard(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Column(
                  children: [
                    SoldRow(
                      dotColor: Theme.of(context).primaryColor,
                      label: 'Units Sold Today',
                      value: data.unitsSoldToday,
                    ),
                    SoldRow(
                      dotColor: Theme.of(context).primaryColor,
                      label: 'Units Sold This Week',
                      value: data.unitsSoldThisWeek,
                    ),
                    SoldRow(
                      dotColor: isDark
                          ? AppColorsDark.textMuted
                          : AppColorsLight.textMuted,
                      label: 'Units Sold This Month',
                      value: data.unitsSoldThisMonth,
                      isLast: true,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        orElse: () => const SizedBox.shrink(),
      ),
    );
  }
}
