import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skeleton/core/networking/api_error_model.dart';
import 'package:skeleton/features/expeness/domain/entity/expenses_peak_days.dart';

part 'expenses_peak_days_state.freezed.dart';

@freezed
abstract class ExpensesPeakDaysState with _$ExpensesPeakDaysState {
  const factory ExpensesPeakDaysState.initial() = ExpensesPeakDaysInitial;
  const factory ExpensesPeakDaysState.loading() = ExpensesPeakDaysLoading;
  const factory ExpensesPeakDaysState.success(ExpensesPeakDays data) =
      ExpensesPeakDaysSuccess;
  const factory ExpensesPeakDaysState.error(ApiErrorModel error) =
      ExpensesPeakDaysError;
}
