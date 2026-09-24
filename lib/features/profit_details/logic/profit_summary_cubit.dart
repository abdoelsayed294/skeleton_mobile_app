import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/helpers/shared_pref_helper.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/profit_details/domain/use_cases/get_profit_summary_use_case.dart';
import 'package:skeleton_mobile_app/features/profit_details/logic/profit_summary_state.dart';

@injectable
class ProfitSummaryCubit extends Cubit<ProfitSummaryState> {
  final GetProfitSummaryUseCase _getProfitSummaryUseCase;

  ProfitSummaryCubit(this._getProfitSummaryUseCase)
    : super(const ProfitSummaryState.initial());

  String selectedPeriod = 'today';
  DateTime selectedDate = DateTime.now();

  void selectDate(DateTime date) {
    selectedDate = date;
    getProfitSummary(
      selectedPeriod,
      from: DateTime(date.year, date.month, date.day).toIso8601String(),
      to: DateTime(
        date.year,
        date.month,
        date.day,
        23,
        59,
        59,
      ).toIso8601String(),
    );
  }

  Future<void> getProfitSummary(
    String period, {
    String? from,
    String? to,
  }) async {
    selectedPeriod = period;
    emit(const ProfitSummaryState.loading());
    final storeId = await SharedPrefHelper.getInt(SharedPrefHelper.storeIdKey);
    final result = await _getProfitSummaryUseCase.invoke(
      period,
      storeId,
      from: from,
      to: to,
    );
    result.when(
      success: (data) => emit(ProfitSummaryState.success(data)),
      failure: (error) => emit(ProfitSummaryState.error(error)),
    );
  }
}
