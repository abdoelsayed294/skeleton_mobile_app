import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/helpers/shared_pref_helper.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/core/widgets/shimmer_block.dart';
import 'package:skeleton_mobile_app/features/home/logic/home_cubit.dart';
import 'package:skeleton_mobile_app/features/home/logic/home_state.dart';
import 'package:skeleton_mobile_app/features/home/ui/widgets/stock_item.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class LowStockList extends StatefulWidget {
  const LowStockList({super.key});

  @override
  State<LowStockList> createState() => _LowStockListState();
}

class _LowStockListState extends State<LowStockList> {
  @override
  void initState() {
    super.initState();
    _getLowStock();
  }

  Future<void> _getLowStock() async {
    final storeId = await SharedPrefHelper.getInt(SharedPrefHelper.storeIdKey);

    if (!mounted) return;

    context.read<HomeCubit>().getLowStock(storeId: storeId);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final isLoading = state.lowStockState.maybeWhen(
          initial: () => true,
          loading: () => true,
          orElse: () => false,
        );
        final data = state.lowStockState.maybeWhen(
          success: (data) => data,
          orElse: () => null,
        );

        final products = data?.lowStockProducts ?? [];

        return Column(
          children: [
            Row(
              children: [
                Text(
                  l10n.lowStock,
                  style: isDark
                      ? AppStyles.stockTitleDark
                      : AppStyles.stockTitleLight,
                ),
                SizedBox(width: 8.w),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.h),
                  decoration: BoxDecoration(
                    color: (isDark ? AppColorsDark.error : AppColorsLight.error)
                        .withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                      color:
                          (isDark ? AppColorsDark.error : AppColorsLight.error)
                              .withValues(alpha: 0.25),
                    ),
                  ),
                  child: Text(
                    '${data?.count ?? 0} ${l10n.items}',
                    style: isDark
                        ? AppStyles.stockBadgeDark
                        : AppStyles.stockBadgeLight,
                  ),
                ),
                const Spacer(),
                Text(
                  l10n.manage,
                  style:
                      (isDark
                              ? AppStyles.stockStatusDark
                              : AppStyles.stockStatusLight)
                          .copyWith(color: Theme.of(context).primaryColor),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            if (isLoading)
              ...List.generate(
                4,
                (index) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 7.h),
                  child: Row(
                    children: [
                      ShimmerBlock(width: 34.w, height: 34.h, radius: 18),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ShimmerBlock(width: 115.w, height: 12.h),
                            SizedBox(height: 7.h),
                            ShimmerBlock(width: 75.w, height: 9.h),
                          ],
                        ),
                      ),
                      ShimmerBlock(width: 48.w, height: 12.h),
                    ],
                  ),
                ),
              ),
            ...products.map((item) {
              final progress = item.limit > 0
                  ? (item.quantity / item.limit).clamp(0.0, 1.0)
                  : 0.0;

              return StockItem(
                name: item.productName,
                count: item.quantity,
                progress: progress,
                warning: item.quantity <= item.limit,
                isDark: isDark,
                l10n: l10n,
              );
            }),
          ],
        );
      },
    );
  }
}
