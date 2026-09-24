import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/core/widgets/dilaog_utils.dart';
import 'package:skeleton_mobile_app/features/product_details/logic/product_header_cubit.dart';
import 'package:skeleton_mobile_app/features/product_details/logic/product_header_state.dart';
import 'package:skeleton_mobile_app/features/product_details/ui/widgets/product_details_section_shimmer.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class ProductOverviewSection extends StatelessWidget {
  const ProductOverviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;

    return BlocConsumer<ProductHeaderCubit, ProductHeaderState>(
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
        initial: () => const ProductDetailsSectionShimmer(height: 258),
        loading: () => const ProductDetailsSectionShimmer(height: 258),
        success: (data) {
          final status = data.stockStatus.toLowerCase();
          final isOutOfStock = status == 'out' || status == 'outofstock';
          final statusColor = isOutOfStock
              ? (isDark ? AppColorsDark.error : AppColorsLight.error)
              : status == 'low'
              ? (isDark ? AppColorsDark.warning : AppColorsLight.warning)
              : (isDark ? AppColorsDark.success : AppColorsLight.success);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 190.h,
                padding: EdgeInsets.all(14.w),
                decoration: BoxDecoration(
                  color: isDark
                      ? AppColorsDark.surface
                      : AppColorsLight.background,
                  borderRadius: BorderRadius.circular(18.r),
                  border: Border.all(
                    color: isDark
                        ? AppColorsDark.border
                        : AppColorsLight.border,
                  ),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Icon(
                        Icons.inventory_2_outlined,
                        size: 78.sp,
                        color: Theme.of(
                          context,
                        ).primaryColor.withValues(alpha: 0.35),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 9.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          color: statusColor.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 6.w,
                              height: 6.w,
                              decoration: BoxDecoration(
                                color: statusColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 5.w),
                            Text(
                              data.stockStatus.toUpperCase(),
                              style:
                                  (isDark
                                          ? AppStyles.stockBadgeDark
                                          : AppStyles.stockBadgeLight)
                                      .copyWith(color: statusColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.bottomStart,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 5.h,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Text(
                          data.itemType,
                          style:
                              (isDark
                                      ? AppStyles.font12MediumDark
                                      : AppStyles.font12MediumLight)
                                  .copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                data.itemName,
                style: isDark
                    ? AppStyles.font24BoldDark
                    : AppStyles.font24BoldLight,
              ),
              SizedBox(height: 4.h),
              Text(
                'Barcode: ${data.barcode}',
                style: isDark
                    ? AppStyles.font12MediumDark
                    : AppStyles.font12MediumLight,
              ),
            ],
          );
        },
        orElse: () => const SizedBox.shrink(),
      ),
    );
  }
}
