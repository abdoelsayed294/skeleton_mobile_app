import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skeleton/core/networking/api_error_model.dart';
import 'package:skeleton/features/expeness/domain/entity/expenses_transactions.dart';

part 'expenses_transactions_state.freezed.dart';

@freezed
abstract class ExpensesTransactionsState with _$ExpensesTransactionsState {
  const factory ExpensesTransactionsState.initial() =
      ExpensesTransactionsInitial;
  const factory ExpensesTransactionsState.loading() =
      ExpensesTransactionsLoading;
  const factory ExpensesTransactionsState.success(ExpensesTransactions data) =
      ExpensesTransactionsSuccess;
  const factory ExpensesTransactionsState.error(ApiErrorModel error) =
      ExpensesTransactionsError;
}
