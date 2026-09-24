import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/core/widgets/dilaog_utils.dart';
import 'package:skeleton_mobile_app/features/product_details/logic/product_header_cubit.dart';
import 'package:skeleton_mobile_app/features/product_details/logic/product_header_state.dart';
import 'package:skeleton_mobile_app/features/product_details/ui/widgets/circle_icon_button.dart';
import 'package:skeleton_mobile_app/features/product_details/ui/widgets/product_details_section_shimmer.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class ProductDetailsAppBar extends StatelessWidget {
  const ProductDetailsAppBar({super.key});

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
        initial: () => const ProductDetailsSectionShimmer(height: 54),
        loading: () => const ProductDetailsSectionShimmer(height: 54),
        success: (data) => Row(
          children: [
            CircleIconButton(
              icon: Icons.arrow_back_ios_new_rounded,
              onTap: () => Navigator.of(context).maybePop(),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    data.itemName,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: isDark
                        ? AppStyles.font16BoldDark
                        : AppStyles.font16BoldLight,
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    'SKU · ${data.barcode}',
                    style: isDark
                        ? AppStyles.font12MediumDark
                        : AppStyles.font12MediumLight,
                  ),
                ],
              ),
            ),
            CircleIconButton(icon: Icons.more_vert_rounded, onTap: null),
          ],
        ),
        orElse: () => const SizedBox.shrink(),
      ),
    );
  }
}
