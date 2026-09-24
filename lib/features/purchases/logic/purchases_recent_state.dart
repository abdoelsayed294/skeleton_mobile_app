import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skeleton_mobile_app/core/networking/api_error_model.dart';
import 'package:skeleton_mobile_app/features/purchases/domain/entity/purchases_recent.dart';

part 'purchases_recent_state.freezed.dart';

@freezed
class PurchasesRecentState with _$PurchasesRecentState {
  const factory PurchasesRecentState.initial() = _Initial;
  const factory PurchasesRecentState.loading() = _Loading;
  const factory PurchasesRecentState.loadingMore(PurchasesRecentEntity data) =
      _LoadingMore;
  const factory PurchasesRecentState.success(PurchasesRecentEntity data) =
      _Success;
  const factory PurchasesRecentState.error(ApiErrorModel error) = _Error;
}
