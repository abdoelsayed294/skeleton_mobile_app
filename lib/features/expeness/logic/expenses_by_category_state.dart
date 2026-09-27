import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skeleton_mobile_app/core/networking/api_error_model.dart';
import 'package:skeleton_mobile_app/features/expeness/domain/entity/expenses_by_category.dart';

part 'expenses_by_category_state.freezed.dart';

@freezed
abstract class ExpensesByCategoryState with _$ExpensesByCategoryState {
  const factory ExpensesByCategoryState.initial() = ExpensesByCategoryInitial;
  const factory ExpensesByCategoryState.loading() = ExpensesByCategoryLoading;
  const factory ExpensesByCategoryState.success(ExpensesByCategory data) =
      ExpensesByCategorySuccess;
  const factory ExpensesByCategoryState.error(ApiErrorModel error) =
      ExpensesByCategoryError;
}
