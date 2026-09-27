import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/helpers/shared_pref_helper.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/expeness/domain/use_case/get_expenses_summary_use_case.dart';
import 'package:skeleton_mobile_app/features/expeness/logic/expenses_summary_state.dart';

@injectable
class ExpensesSummaryCubit extends Cubit<ExpensesSummaryState> {
  ExpensesSummaryCubit(this._useCase)
    : super(const ExpensesSummaryState.initial());
  final GetExpensesSummaryUseCase _useCase;

  Future<void> getExpensesSummary({
    required String period,
    required DateTime date,
  }) async {
    emit(const ExpensesSummaryState.loading());
    final storeId = await SharedPrefHelper.getInt(SharedPrefHelper.storeIdKey);
    final result = await _useCase.invoke(storeId, period, _dateParam(date));
    result.when(
      success: (data) => emit(ExpensesSummaryState.success(data)),
      failure: (error) => emit(ExpensesSummaryState.error(error)),
    );
  }
}

String _dateParam(DateTime date) =>
    '${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
