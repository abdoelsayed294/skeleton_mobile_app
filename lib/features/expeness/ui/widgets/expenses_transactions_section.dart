import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeleton_mobile_app/core/widgets/dilaog_utils.dart';
import 'package:skeleton_mobile_app/features/expeness/logic/expenses_transactions_cubit.dart';
import 'package:skeleton_mobile_app/features/expeness/logic/expenses_transactions_state.dart';
import 'package:skeleton_mobile_app/features/expeness/ui/widgets/all_transactions_card.dart';
import 'package:skeleton_mobile_app/features/expeness/ui/widgets/expense_transaction.dart';
import 'package:skeleton_mobile_app/features/expeness/ui/widgets/expenses_transactions_shimmer.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class ExpensesTransactionsSection extends StatelessWidget {
  const ExpensesTransactionsSection({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BlocConsumer<ExpensesTransactionsCubit, ExpensesTransactionsState>(
      listener: (context, state) {
        state.maybeWhen(
          error: (error) => DialogUtils.showMessage(
            context: context,
            type: DialogType.error,
            title: l10n.errorTitle,
            message: error.error?.message ?? l10n.genericError,
          ),
          orElse: () {},
        );
      },
      builder: (context, state) => state.maybeWhen(
        loading: () => const ExpensesTransactionsShimmer(),
        success: (data) => AllTransactionsCard(
          onSortTap: () {
            final cubit = context.read<ExpensesTransactionsCubit>();
            cubit.changeSort(
              cubit.currentSort == 'latest' ? 'oldest' : 'latest',
            );
          },
          onLoadMore: context.read<ExpensesTransactionsCubit>().loadNextPage,
          hasMore: context.read<ExpensesTransactionsCubit>().hasMore,
          isLoadingMore: data.isLoadingMore,
          sortLabel: data.sort == 'oldest' ? l10n.oldest : l10n.latest,
          transactions: data.items
              .map(
                (item) => ExpenseTransaction(
                  avatarLabel: (item.title?.isNotEmpty ?? false)
                      ? item.title![0].toUpperCase()
                      : '?',
                  title: item.title ?? '',
                  subtitle: item.type ?? item.notes ?? '',
                  amount: item.value,
                  avatarBg: Theme.of(
                    context,
                  ).colorScheme.primary.withValues(alpha: .12),
                  avatarColor: Theme.of(context).colorScheme.primary,
                ),
              )
              .toList(),
        ),
        orElse: () => const ExpensesTransactionsShimmer(),
      ),
    );
  }
}
