import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/widgets/dilaog_utils.dart';
import 'package:skeleton_mobile_app/features/home/ui/widgets/section_card.dart';
import 'package:skeleton_mobile_app/features/product_details/logic/product_header_cubit.dart';
import 'package:skeleton_mobile_app/features/product_details/logic/product_header_state.dart';
import 'package:skeleton_mobile_app/features/product_details/ui/widgets/info_row.dart';
import 'package:skeleton_mobile_app/features/product_details/ui/widgets/product_details_section_shimmer.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class ProductInfoCard extends StatelessWidget {
  const ProductInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
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
        initial: () => const ProductDetailsSectionShimmer(height: 140),
        loading: () => const ProductDetailsSectionShimmer(height: 140),
        success: (data) => SectionCard(
          child: Padding(
            padding: EdgeInsets.only(bottom: 2.h),
            child: Column(
              children: [
                InfoRow(
                  icon: Icons.qr_code_2_rounded,
                  label: 'SKU / Barcode',
                  value: data.barcode,
                ),
                InfoRow(
                  icon: Icons.grid_view_rounded,
                  label: 'Category',
                  value: data.itemType,
                ),
                InfoRow(
                  icon: Icons.store_outlined,
                  label: 'Stock Status',
                  value: data.stockStatus,
                  isLast: true,
                ),
              ],
            ),
          ),
        ),
        orElse: () => const SizedBox.shrink(),
      ),
    );
  }
}
