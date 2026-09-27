import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/widgets/empty_state_message.dart';
import 'package:skeleton_mobile_app/core/widgets/recent_transactions_shimmer_list.dart';
import 'package:skeleton_mobile_app/features/profit_details/ui/widgets/profit_details_header.dart';
import 'package:skeleton_mobile_app/features/reports/ui/widgets/transaction_row.dart';
import 'package:skeleton_mobile_app/features/today_sales/logic/today_recent_transaction_cubit.dart';
import 'package:skeleton_mobile_app/features/today_sales/logic/today_recent_transaction_state.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class TodayRecentTransactionsScreen extends StatefulWidget {
  const TodayRecentTransactionsScreen({super.key});

  @override
  State<TodayRecentTransactionsScreen> createState() =>
      _TodayRecentTransactionsScreenState();
}

class _TodayRecentTransactionsScreenState
    extends State<TodayRecentTransactionsScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_loadMoreWhenNeeded);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_loadMoreWhenNeeded)
      ..dispose();
    super.dispose();
  }

  Future<void> _loadMoreWhenNeeded() async {
    if (_scrollController.hasClients &&
        _scrollController.position.extentAfter < 240 &&
        context.read<TodayRecentTransactionCubit>().hasMore &&
        !context.read<TodayRecentTransactionCubit>().isLoadingMore) {
      setState(() => _isLoadingMore = true);
      await context.read<TodayRecentTransactionCubit>().loadMore();
      if (mounted) setState(() => _isLoadingMore = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 8.h),
              child: ProfitDetailsHeader(
                title: l10n.recentTransactions,
                onBack: () => Navigator.of(context).maybePop(),
                showDateSelector: false,
              ),
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: context.read<TodayRecentTransactionCubit>().refresh,
                child:
                    BlocBuilder<
                      TodayRecentTransactionCubit,
                      TodayRecentTransactionState
                    >(
                      builder: (context, state) => state.when(
                        initial: () => RecentTransactionsShimmerList(
                          scrollController: _scrollController,
                        ),
                        loading: () => RecentTransactionsShimmerList(
                          scrollController: _scrollController,
                        ),
                        success: (transactions) {
                          if (transactions.isEmpty) {
                            return ListView(
                              physics: const AlwaysScrollableScrollPhysics(),
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.sizeOf(context).height * .7,
                                  child: EmptyStateMessage(
                                    message: l10n.noRecentTransactions,
                                  ),
                                ),
                              ],
                            );
                          }
                          return ListView.builder(
                            controller: _scrollController,
                            physics: const AlwaysScrollableScrollPhysics(),
                            padding: EdgeInsets.all(16.w),
                            itemCount:
                                transactions.length + (_isLoadingMore ? 1 : 0),
                            itemBuilder: (context, index) {
                              if (index == transactions.length) {
                                return Padding(
                                  padding: EdgeInsets.all(16.w),
                                  child: const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              }
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
                            },
                          );
                        },
                        error: (error) => ListView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          children: [
                            SizedBox(
                              height: MediaQuery.sizeOf(context).height * .7,
                              child: Center(
                                child: Text(
                                  error.error?.message ?? l10n.genericError,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
