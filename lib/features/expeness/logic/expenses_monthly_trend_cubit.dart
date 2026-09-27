import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/helpers/shared_pref_helper.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/expeness/domain/use_case/get_expenses_monthly_trend_use_case.dart';
import 'package:skeleton_mobile_app/features/expeness/logic/expenses_monthly_trend_state.dart';

@injectable
class ExpensesMonthlyTrendCubit extends Cubit<ExpensesMonthlyTrendState> {
  ExpensesMonthlyTrendCubit(this._useCase)
    : super(const ExpensesMonthlyTrendState.initial());
  final GetExpensesMonthlyTrendUseCase _useCase;

  Future<void> getExpensesMonthlyTrend(DateTime date) async {
    emit(const ExpensesMonthlyTrendState.loading());
    final storeId = await SharedPrefHelper.getInt(SharedPrefHelper.storeIdKey);
    final dateParam =
        '${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
    final result = await _useCase.invoke(storeId, dateParam);
    result.when(
      success: (data) => emit(ExpensesMonthlyTrendState.success(data)),
      failure: (error) => emit(ExpensesMonthlyTrendState.error(error)),
    );
  }
}
