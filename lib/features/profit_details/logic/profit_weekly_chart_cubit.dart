import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/helpers/shared_pref_helper.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/profit_details/domain/use_cases/get_profit_weekly_chart_use_case.dart';
import 'package:skeleton_mobile_app/features/profit_details/logic/profit_weekly_chart_state.dart';

@injectable
class ProfitWeeklyChartCubit extends Cubit<ProfitWeeklyChartState> {
  final GetProfitWeeklyChartUseCase _getProfitWeeklyChartUseCase;

  ProfitWeeklyChartCubit(this._getProfitWeeklyChartUseCase)
    : super(const ProfitWeeklyChartState.initial());

  Future<void> getProfitWeeklyChart() async {
    emit(const ProfitWeeklyChartState.loading());
    final storeId = await SharedPrefHelper.getInt(SharedPrefHelper.storeIdKey);
    final result = await _getProfitWeeklyChartUseCase.invoke(storeId);
    result.when(
      success: (data) => emit(ProfitWeeklyChartState.success(data)),
      failure: (error) => emit(ProfitWeeklyChartState.error(error)),
    );
  }
}
