import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeleton_mobile_app/core/helpers/shared_pref_helper.dart';
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
    final storeId = await SharedPrefHelper.getInt(
      SharedPrefHelper.storeIdKey,
    );

    if (!mounted) return;

    context.read<HomeCubit>().getTopProducts(
      storeId: storeId,
      take: 5,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final products = state.maybeWhen(
          success: (data) {
            if (data is List<TopProductEntity>) {
              return data;
            }

            return <TopProductEntity>[];
          },
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
              ...List.generate(products.length, (index) {
                final product = products[index];

                return ProductRow(
                  rank: index + 1,
                  title: product.productName,
                  subtitle:
                      '${product.quantitySold} ${l10n.unitsSold}',
                  price: product.totalValue.toStringAsFixed(0),
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

