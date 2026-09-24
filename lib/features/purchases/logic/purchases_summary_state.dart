import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skeleton_mobile_app/core/networking/api_error_model.dart';
import 'package:skeleton_mobile_app/features/purchases/domain/entity/purchases_summary.dart';

part 'purchases_summary_state.freezed.dart';

@freezed
class PurchasesSummaryState with _$PurchasesSummaryState {
  const factory PurchasesSummaryState.initial() = _Initial;
  const factory PurchasesSummaryState.loading() = _Loading;
  const factory PurchasesSummaryState.success(PurchasesSummaryEntity data) =
      _Success;
  const factory PurchasesSummaryState.error(ApiErrorModel error) = _Error;
}
