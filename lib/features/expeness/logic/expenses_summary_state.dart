import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skeleton_mobile_app/core/networking/api_error_model.dart';
import 'package:skeleton_mobile_app/features/expeness/domain/entity/expenses_summary.dart';

part 'expenses_summary_state.freezed.dart';

@freezed
abstract class ExpensesSummaryState with _$ExpensesSummaryState {
  const factory ExpensesSummaryState.initial() = ExpensesSummaryInitial;
  const factory ExpensesSummaryState.loading() = ExpensesSummaryLoading;
  const factory ExpensesSummaryState.success(ExpensesSummary data) =
      ExpensesSummarySuccess;
  const factory ExpensesSummaryState.error(ApiErrorModel error) =
      ExpensesSummaryError;
}
