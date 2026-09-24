import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/helpers/shared_pref_helper.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/core/widgets/shimmer_block.dart';
import 'package:skeleton_mobile_app/features/home/ui/widgets/section_card.dart';
import 'package:skeleton_mobile_app/features/reports/logic/top_selling_cubit.dart';
import 'package:skeleton_mobile_app/features/reports/logic/top_selling_state.dart';
import 'package:skeleton_mobile_app/features/reports/ui/widgets/top_product_row.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class TopProductsReportList extends StatefulWidget {
  final DateTime selectedMonth;

  const TopProductsReportList({super.key, required this.selectedMonth});

  @override
  State<TopProductsReportList> createState() => _TopProductsReportListState();
}

class _TopProductsReportListState extends State<TopProductsReportList> {
  @override
  void initState() {
    super.initState();
    _fetchTopSelling();
  }

  @override
  void didUpdateWidget(covariant TopProductsReportList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedMonth.year != widget.selectedMonth.year ||
        oldWidget.selectedMonth.month != widget.selectedMonth.month) {
      _fetchTopSelling();
    }
  }

  Future<void> _fetchTopSelling() async {
    final storeId = await SharedPrefHelper.getInt(SharedPrefHelper.storeIdKey);
    if (!mounted) return;
    context.read<TopSellingCubit>().getTopSelling(
      storeId: storeId,
      period: 'month',
      take: 5,
      year: widget.selectedMonth.year,
      month: widget.selectedMonth.month,
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
                  style:
                      (isDark
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
                  initial: () => Column(
                    children: List.generate(
                      5,
                      (index) => Padding(
                        padding: EdgeInsets.symmetric(vertical: 9.h),
                        child: Row(
                          children: [
                            ShimmerBlock(width: 26.w, height: 26.h, radius: 14),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ShimmerBlock(width: 115.w, height: 12.h),
                                  SizedBox(height: 7.h),
                                  ShimmerBlock(width: 70.w, height: 9.h),
                                ],
                              ),
                            ),
                            ShimmerBlock(width: 48.w, height: 14.h),
                          ],
                        ),
                      ),
                    ),
                  ),
                  loading: () => Column(
                    children: List.generate(
                      5,
                      (index) => Padding(
                        padding: EdgeInsets.symmetric(vertical: 9.h),
                        child: Row(
                          children: [
                            ShimmerBlock(width: 26.w, height: 26.h, radius: 14),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ShimmerBlock(width: 115.w, height: 12.h),
                                  SizedBox(height: 7.h),
                                  ShimmerBlock(width: 70.w, height: 9.h),
                                ],
                              ),
                            ),
                            ShimmerBlock(width: 48.w, height: 14.h),
                          ],
                        ),
                      ),
                    ),
                  ),
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
                          change:
                              '${product.changePct >= 0 ? '+' : ''}${product.changePct.toStringAsFixed(0)}%',
                          isPositive: product.changePct >= 0,
                          isDark: isDark,
                          isLast: index == products.length - 1,
                        );
                      }),
                    );
                  },
                  error: (error) =>
                      Center(child: Text(error.error?.message ?? 'Error')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
