import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/routing/routes.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/core/widgets/dilaog_utils.dart';
import 'package:skeleton_mobile_app/features/inventory/domain/entity/inventroy_product_response.dart';
import 'package:skeleton_mobile_app/features/inventory/logic/inventory_product_cubit.dart';
import 'package:skeleton_mobile_app/features/inventory/logic/inventory_product_state.dart';
import 'package:skeleton_mobile_app/features/inventory/ui/widgets/inventory_product_tile.dart';
import 'package:skeleton_mobile_app/features/inventory/ui/widgets/inventory_product_list_shimmer.dart';
import 'package:skeleton_mobile_app/features/inventory/ui/widgets/stock_status.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class InventoryProductList extends StatefulWidget {
  const InventoryProductList({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  State<InventoryProductList> createState() => _InventoryProductListState();
}

class _InventoryProductListState extends State<InventoryProductList> {
  bool _isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_handleScroll);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_handleScroll);
    super.dispose();
  }

  void _handleScroll() {
    if (widget.scrollController.hasClients &&
        widget.scrollController.position.extentAfter < 250 &&
        !_isLoadingMore) {
      _loadNextPage();
    }
  }

  Future<void> _loadNextPage() async {
    final cubit = context.read<InventoryProductCubit>();
    if (!cubit.hasMore || cubit.isLoadingMore) return;

    setState(() => _isLoadingMore = true);
    await cubit.loadNextPage();
    if (mounted) {
      setState(() => _isLoadingMore = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;

    return BlocConsumer<InventoryProductCubit, InventoryProductState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (_) => WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) _handleScroll();
          }),
          error: (error) => DialogUtils.showMessage(
            context: context,
            type: DialogType.error,
            title: l10n.errorTitle,
            message: error.error?.message ?? l10n.genericError,
          ),
          orElse: () {},
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const InventoryProductListShimmer(),
          success: (data) {
            final products = data.items?.whereType<Items>().toList() ?? [];

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                      '· ${data.total ?? products.length}',
                      style:
                          (isDark
                                  ? AppStyles.font12MediumDark
                                  : AppStyles.font12MediumLight)
                              .copyWith(fontWeight: FontWeight.w700),
                    ),
                    const Spacer(),
                    PopupMenuButton<String>(
                      tooltip: l10n.sort,
                      onSelected: (sortBy) => context
                          .read<InventoryProductCubit>()
                          .sortProducts(sortBy == 'default' ? null : sortBy),
                      itemBuilder: (context) {
                        final isArabic =
                            Localizations.localeOf(context).languageCode ==
                            'ar';
                        return [
                          PopupMenuItem(
                            value: 'default',
                            child: Text(isArabic ? 'الافتراضي' : 'Default'),
                          ),
                          PopupMenuItem(
                            value: 'name_asc',
                            child: Text(
                              isArabic ? 'الاسم: أ إلى ي' : 'Name: A to Z',
                            ),
                          ),
                          PopupMenuItem(
                            value: 'price_asc',
                            child: Text(
                              isArabic
                                  ? 'السعر: الأقل أولاً'
                                  : 'Price: low to high',
                            ),
                          ),
                          PopupMenuItem(
                            value: 'price_desc',
                            child: Text(
                              isArabic
                                  ? 'السعر: الأعلى أولاً'
                                  : 'Price: high to low',
                            ),
                          ),
                          PopupMenuItem(
                            value: 'quantity_asc',
                            child: Text(
                              isArabic
                                  ? 'الكمية: الأقل أولاً'
                                  : 'Quantity: low to high',
                            ),
                          ),
                          PopupMenuItem(
                            value: 'quantity_desc',
                            child: Text(
                              isArabic
                                  ? 'الكمية: الأعلى أولاً'
                                  : 'Quantity: high to low',
                            ),
                          ),
                        ];
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 5.h,
                          horizontal: 2.w,
                        ),
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
                ...products.asMap().entries.map((entry) {
                  final product = entry.value;

                  return InventoryProductTile(
                    onTap: product.id == null
                        ? null
                        : () => Navigator.of(context).pushNamed(
                            Routes.productDetailsScreen,
                            arguments: product.id,
                          ),
                    name: product.itemName ?? '',
                    category: product.itemType ?? '',
                    quantity: (product.quantityValue ?? product.quantity ?? 0)
                        .toString(),
                    minimum: (product.minStock ?? product.minStockLevel ?? 0)
                        .toString(),
                    price: (product.price1 ?? 0).toString(),
                    status: _stockStatusFrom(product.stockStatus),
                    icon: Icons.inventory_2_outlined,
                    isLast: entry.key == products.length - 1 && !_isLoadingMore,
                  );
                }),
                if (_isLoadingMore)
                  Padding(
                    padding: EdgeInsets.only(top: 12.h),
                    child: const Center(child: CircularProgressIndicator()),
                  ),
              ],
            );
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}

StockStatus _stockStatusFrom(String? value) {
  switch (value?.toLowerCase().replaceAll(RegExp(r'[^a-z]'), '')) {
    case 'outofstock':
    case 'out':
      return StockStatus.out;

    case 'lowstock':
    case 'low':
      return StockStatus.low;

    default:
      return StockStatus.inStock;
  }
}
