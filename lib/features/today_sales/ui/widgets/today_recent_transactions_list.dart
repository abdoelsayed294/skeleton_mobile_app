import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/helpers/shared_pref_helper.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/core/widgets/shimmer_block.dart';
import 'package:skeleton_mobile_app/features/home/ui/widgets/section_card.dart';
import 'package:skeleton_mobile_app/features/today_sales/logic/today_recent_transaction_cubit.dart';
import 'package:skeleton_mobile_app/features/today_sales/logic/today_recent_transaction_state.dart';
import 'package:skeleton_mobile_app/features/reports/ui/widgets/transaction_row.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class TodayRecentTransactionsList extends StatefulWidget {
  final DateTime selectedDate;

  const TodayRecentTransactionsList({super.key, required this.selectedDate});

  @override
  State<TodayRecentTransactionsList> createState() =>
      _TodayRecentTransactionsListState();
}

class _TodayRecentTransactionsListState
    extends State<TodayRecentTransactionsList> {
  @override
  void initState() {
    super.initState();
    _fetchRecentTransactions();
  }

  @override
  void didUpdateWidget(covariant TodayRecentTransactionsList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedDate != widget.selectedDate) {
      _fetchRecentTransactions();
    }
  }

  Future<void> _fetchRecentTransactions() async {
    final storeId = await SharedPrefHelper.getInt(SharedPrefHelper.storeIdKey);
    if (!mounted) return;
    context.read<TodayRecentTransactionCubit>().getRecentTransactions(
      storeId: storeId,
      date: widget.selectedDate,
      take: 10,
      all: false,
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
                    l10n.recentTransactions,
                    style: isDark
                        ? AppStyles.productTitleDark
                        : AppStyles.productTitleLight,
                  ),
                ),
                Text(
                  l10n.viewAll,
                  style:
                      (isDark
                              ? AppStyles.productSubtitleDark
                              : AppStyles.productSubtitleLight)
                          .copyWith(color: Theme.of(context).primaryColor),
                ),
              ],
            ),
            SizedBox(height: 6.h),
            BlocBuilder<
              TodayRecentTransactionCubit,
              TodayRecentTransactionState
            >(
              builder: (context, state) {
                return state.when(
                  initial: () => Column(
                    children: List.generate(
                      4,
                      (index) => Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        child: Row(
                          children: [
                            ShimmerBlock(width: 38.w, height: 38.h, radius: 20),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ShimmerBlock(width: 110.w, height: 12.h),
                                  SizedBox(height: 7.h),
                                  ShimmerBlock(width: 75.w, height: 9.h),
                                ],
                              ),
                            ),
                            ShimmerBlock(width: 58.w, height: 13.h),
                          ],
                        ),
                      ),
                    ),
                  ),
                  loading: () => Column(
                    children: List.generate(
                      4,
                      (index) => Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        child: Row(
                          children: [
                            ShimmerBlock(width: 38.w, height: 38.h, radius: 20),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ShimmerBlock(width: 110.w, height: 12.h),
                                  SizedBox(height: 7.h),
                                  ShimmerBlock(width: 75.w, height: 9.h),
                                ],
                              ),
                            ),
                            ShimmerBlock(width: 58.w, height: 13.h),
                          ],
                        ),
                      ),
                    ),
                  ),
                  success: (transactions) {
                    if (transactions.isEmpty) {
                      return const Center(
                        child: Text('No recent transactions.'),
                      );
                    }
                    return Column(
                      children: List.generate(transactions.length, (index) {
                        final txn = transactions[index];
                        return TransactionRow(
                          orderId: txn.orderId,
                          time: txn.time,
                          tag: txn.paymentMethod,
                          kind: txn.kind,
                          amount: txn.amount.toStringAsFixed(2),
                          isDark: isDark,
                          isLast: index == transactions.length - 1,
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
