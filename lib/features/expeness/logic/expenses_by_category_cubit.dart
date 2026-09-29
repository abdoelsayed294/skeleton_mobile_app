import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:skeleton/core/helpers/shared_pref_helper.dart';
import 'package:skeleton/core/networking/api_result.dart';
import 'package:skeleton/features/expeness/domain/use_case/get_expenses_by_category_use_case.dart';
import 'package:skeleton/features/expeness/logic/expenses_by_category_state.dart';

@injectable
class ExpensesByCategoryCubit extends Cubit<ExpensesByCategoryState> {
  ExpensesByCategoryCubit(this._useCase)
    : super(const ExpensesByCategoryState.initial());
  final GetExpensesByCategoryUseCase _useCase;

  Future<void> getExpensesByCategory({
    required String period,
    required DateTime date,
  }) async {
    emit(const ExpensesByCategoryState.loading());
    final storeId = await SharedPrefHelper.getInt(SharedPrefHelper.storeIdKey);
    final dateParam =
        '${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
    final result = await _useCase.invoke(storeId, period, dateParam);
    result.when(
      success: (data) => emit(ExpensesByCategoryState.success(data)),
      failure: (error) => emit(ExpensesByCategoryState.error(error)),
    );
  }
}
