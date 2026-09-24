import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/helpers/shared_pref_helper.dart';
import 'package:skeleton_mobile_app/core/widgets/shimmer_block.dart';
import 'package:skeleton_mobile_app/features/home/domain/entities/top_product_entity.dart';
import 'package:skeleton_mobile_app/features/home/logic/home_cubit.dart';
import 'package:skeleton_mobile_app/features/home/logic/home_state.dart';
import 'package:skeleton_mobile_app/features/home/ui/widgets/product_row.dart';
import 'package:skeleton_mobile_app/features/home/ui/widgets/section_card.dart';
import 'package:skeleton_mobile_app/features/home/ui/widgets/section_header.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class TopSellingProducts extends StatefulWidget {
  const TopSellingProducts({super.key});

  @override
  State<TopSellingProducts> createState() => _TopSellingProductsState();
}

class _TopSellingProductsState extends State<TopSellingProducts> {
  @override
  void initState() {
    super.initState();
    _getTopProducts();
  }

  Future<void> _getTopProducts() async {
    final storeId = await SharedPrefHelper.getInt(SharedPrefHelper.storeIdKey);

    if (!mounted) return;

    context.read<HomeCubit>().getTopProducts(
      storeId: storeId,
      take: 5,
      all: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final isLoading = state.topProductsState.maybeWhen(
          initial: () => true,
          loading: () => true,
          orElse: () => false,
        );
        final products = state.topProductsState.maybeWhen(
          success: (data) => data,
          orElse: () => <TopProductEntity>[],
        );

        return SectionCard(
          child: Column(
            children: [
              SectionHeader(
                title: l10n.topSellingProducts,
                action: l10n.viewAll,
                isDark: isDark,
              ),
              if (isLoading)
                ...List.generate(
                  5,
                  (index) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 9.h),
                    child: Row(
                      children: [
                        ShimmerBlock(width: 28.w, height: 28.h, radius: 14),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ShimmerBlock(width: 120.w, height: 12.h),
                              SizedBox(height: 7.h),
                              ShimmerBlock(width: 75.w, height: 9.h),
                            ],
                          ),
                        ),
                        ShimmerBlock(width: 55.w, height: 13.h),
                      ],
                    ),
                  ),
                ),
              ...List.generate(products.length, (index) {
                final product = products[index];

                return ProductRow(
                  rank: index + 1,
                  title: product.productName,
                  subtitle: '${product.sold} ${l10n.unitsSold}',
                  price: product.sellingPrice.toStringAsFixed(0),
                  icon: Icons.shopping_bag_outlined,
                  accentColor: const Color(0xFF2196F3),
                  isDark: isDark,
                  isLast: index == products.length - 1,
                );
              }),
            ],
          ),
        );
      },
    );
  }
}
