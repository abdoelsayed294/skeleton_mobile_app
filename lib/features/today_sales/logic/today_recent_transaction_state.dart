import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skeleton_mobile_app/core/networking/api_error_model.dart';
import 'package:skeleton_mobile_app/features/today_sales/domain/entities/today_recent_transaction_entity.dart';

part 'today_recent_transaction_state.freezed.dart';

@freezed
class TodayRecentTransactionState with _$TodayRecentTransactionState {
  const factory TodayRecentTransactionState.initial() = _Initial;
  const factory TodayRecentTransactionState.loading() = _Loading;
  const factory TodayRecentTransactionState.success(List<TodayRecentTransactionEntity> data) = _Success;
  const factory TodayRecentTransactionState.error(ApiErrorModel error) = _Error;
}
