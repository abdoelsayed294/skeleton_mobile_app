import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skeleton_mobile_app/core/networking/api_error_model.dart';
import 'package:skeleton_mobile_app/features/profit_details/domain/entity/profit_weekly_chart.dart';

part 'profit_weekly_chart_state.freezed.dart';

@freezed
class ProfitWeeklyChartState with _$ProfitWeeklyChartState {
  const factory ProfitWeeklyChartState.initial() = _Initial;
  const factory ProfitWeeklyChartState.loading() = _Loading;
  const factory ProfitWeeklyChartState.success(ProfitWeeklyChart data) =
      _Success;
  const factory ProfitWeeklyChartState.error(ApiErrorModel error) = _Error;
}
