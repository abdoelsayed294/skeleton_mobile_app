import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/widgets/empty_state_message.dart';
import 'package:skeleton_mobile_app/core/widgets/shimmer_block.dart';
import 'package:skeleton_mobile_app/features/profit_details/ui/widgets/profit_details_header.dart';
import 'package:skeleton_mobile_app/features/reports/logic/recent_transaction_cubit.dart';
import 'package:skeleton_mobile_app/features/reports/logic/recent_transaction_state.dart';
import 'package:skeleton_mobile_app/features/reports/ui/widgets/transaction_row.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class ReportsRecentTransactionsScreen extends StatefulWidget {
  const ReportsRecentTransactionsScreen({super.key});

  @override
  State<ReportsRecentTransactionsScreen> createState() =>
      _ReportsRecentTransactionsScreenState();
}

class _ReportsRecentTransactionsScreenState
    extends State<ReportsRecentTransactionsScreen> {
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
        context.read<RecentTransactionCubit>().hasMore &&
        !context.read<RecentTransactionCubit>().isLoadingMore) {
      setState(() => _isLoadingMore = true);
      await context.read<RecentTransactionCubit>().loadMore();
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
              child:
                  BlocBuilder<RecentTransactionCubit, RecentTransactionState>(
                    builder: (context, state) => state.when(
                      initial: () => _buildShimmerList(),
                      loading: () => _buildShimmerList(),
                      success: (transactions) {
                        if (transactions.isEmpty) {
                          return EmptyStateMessage(
                            message: l10n.noRecentTransactions,
                          );
                        }
                        return ListView.builder(
                          controller: _scrollController,
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
                      error: (error) => Center(
                        child: Text(error.error?.message ?? l10n.genericError),
                      ),
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShimmerList() => ListView.separated(
    controller: _scrollController,
    padding: EdgeInsets.all(16.w),
    itemCount: 10,
    separatorBuilder: (context, index) => SizedBox(height: 14.h),
    itemBuilder: (context, index) => Row(
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
  );
}
