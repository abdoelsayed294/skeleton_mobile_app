import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skeleton_mobile_app/core/networking/api_error_model.dart';
import 'package:skeleton_mobile_app/features/profit_details/domain/entity/profit_summary.dart';

part 'profit_summary_state.freezed.dart';

@freezed
class ProfitSummaryState with _$ProfitSummaryState {
  const factory ProfitSummaryState.initial() = _Initial;
  const factory ProfitSummaryState.loading() = _Loading;
  const factory ProfitSummaryState.success(ProfitSummary data) = _Success;
  const factory ProfitSummaryState.error(ApiErrorModel error) = _Error;
}
