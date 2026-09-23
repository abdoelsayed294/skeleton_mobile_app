import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/helpers/shared_pref_helper.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/features/home/ui/widgets/section_card.dart';
import 'package:skeleton_mobile_app/features/reports/logic/recent_transaction_cubit.dart';
import 'package:skeleton_mobile_app/features/reports/logic/recent_transaction_state.dart';
import 'package:skeleton_mobile_app/features/reports/ui/widgets/transaction_row.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class RecentTransactionsList extends StatefulWidget {
  const RecentTransactionsList({super.key});

  @override
  State<RecentTransactionsList> createState() => _RecentTransactionsListState();
}

class _RecentTransactionsListState extends State<RecentTransactionsList> {
  @override
  void initState() {
    super.initState();
    _fetchRecentTransactions();
  }

  Future<void> _fetchRecentTransactions() async {
    final storeId = await SharedPrefHelper.getInt(SharedPrefHelper.storeIdKey);
    if (!mounted) return;
    context.read<RecentTransactionCubit>().getRecentTransactions(
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
                    l10n.recentTransactions,
                    style: isDark
                        ? AppStyles.productTitleDark
                        : AppStyles.productTitleLight,
                  ),
                ),
                Text(
                  l10n.viewAll,
                  style: (isDark
                          ? AppStyles.productSubtitleDark
                          : AppStyles.productSubtitleLight)
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
              ],
            ),
            SizedBox(height: 6.h),
            BlocBuilder<RecentTransactionCubit, RecentTransactionState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const SizedBox.shrink(),
                  loading: () => const Center(child: CircularProgressIndicator()),
                  success: (transactions) {
                    if (transactions.isEmpty) {
                      return const Center(child: Text('No recent transactions.'));
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

