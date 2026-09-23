import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/helpers/shared_pref_helper.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/features/home/ui/widgets/section_card.dart';
import 'package:skeleton_mobile_app/features/reports/logic/top_selling_cubit.dart';
import 'package:skeleton_mobile_app/features/reports/logic/top_selling_state.dart';
import 'package:skeleton_mobile_app/features/reports/ui/widgets/top_product_row.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class TopProductsReportList extends StatefulWidget {
  const TopProductsReportList({super.key});

  @override
  State<TopProductsReportList> createState() => _TopProductsReportListState();
}

class _TopProductsReportListState extends State<TopProductsReportList> {
  @override
  void initState() {
    super.initState();
    _fetchTopSelling();
  }

  Future<void> _fetchTopSelling() async {
    final storeId = await SharedPrefHelper.getInt(SharedPrefHelper.storeIdKey);
    if (!mounted) return;
    context.read<TopSellingCubit>().getTopSelling(
          storeId: storeId,
          period: 'month',
          take: 5,
        );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;

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
            BlocBuilder<TopSellingCubit, TopSellingState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const SizedBox.shrink(),
                  loading: () => const Center(child: CircularProgressIndicator()),
                  success: (products) {
                    if (products.isEmpty) {
                      return Center(child: Text('No top selling products.'));
                    }
                    return Column(
                      children: List.generate(products.length, (index) {
                        final product = products[index];
                        return TopProductRow(
                          rank: index + 1,
                          title: product.productName,
                          unitsSold: product.unitsSold.toString(),
                          price: product.revenue.toStringAsFixed(0),
                          change: '${product.changePct >= 0 ? '+' : ''}${product.changePct.toStringAsFixed(0)}%',
                          isPositive: product.changePct >= 0,
                          isDark: isDark,
                          isLast: index == products.length - 1,
                        );
                      }),
                    );
                  },
                  error: (error) => Center(child: Text(error.error?.message ?? 'Error')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

