import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skeleton/core/networking/api_error_model.dart';
import 'package:skeleton/features/expeness/domain/entity/expenses_monthly_trend.dart';

part 'expenses_monthly_trend_state.freezed.dart';

@freezed
abstract class ExpensesMonthlyTrendState with _$ExpensesMonthlyTrendState {
  const factory ExpensesMonthlyTrendState.initial() =
      ExpensesMonthlyTrendInitial;
  const factory ExpensesMonthlyTrendState.loading() =
      ExpensesMonthlyTrendLoading;
  const factory ExpensesMonthlyTrendState.success(ExpensesMonthlyTrend data) =
      ExpensesMonthlyTrendSuccess;
  const factory ExpensesMonthlyTrendState.error(ApiErrorModel error) =
      ExpensesMonthlyTrendError;
}
