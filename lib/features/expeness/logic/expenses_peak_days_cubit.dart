import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:skeleton/core/helpers/shared_pref_helper.dart';
import 'package:skeleton/core/networking/api_result.dart';
import 'package:skeleton/features/expeness/domain/use_case/get_expenses_peak_days_use_case.dart';
import 'package:skeleton/features/expeness/logic/expenses_peak_days_state.dart';

@injectable
class ExpensesPeakDaysCubit extends Cubit<ExpensesPeakDaysState> {
  ExpensesPeakDaysCubit(this._useCase)
    : super(const ExpensesPeakDaysState.initial());
  final GetExpensesPeakDaysUseCase _useCase;

  Future<void> getExpensesPeakDays({int take = 5}) async {
    emit(const ExpensesPeakDaysState.loading());
    final storeId = await SharedPrefHelper.getInt(SharedPrefHelper.storeIdKey);
    final result = await _useCase.invoke(storeId, take: take);
    result.when(
      success: (data) => emit(ExpensesPeakDaysState.success(data)),
      failure: (error) => emit(ExpensesPeakDaysState.error(error)),
    );
  }
}
