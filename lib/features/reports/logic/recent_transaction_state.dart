import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skeleton_mobile_app/core/networking/api_error_model.dart';
import 'package:skeleton_mobile_app/features/reports/domain/entities/recent_transaction_entity.dart';

part 'recent_transaction_state.freezed.dart';

@freezed
class RecentTransactionState with _$RecentTransactionState {
  const factory RecentTransactionState.initial() = _Initial;
  const factory RecentTransactionState.loading() = _Loading;
  const factory RecentTransactionState.success(List<RecentTransactionEntity> data) = _Success;
  const factory RecentTransactionState.error(ApiErrorModel error) = _Error;
}
