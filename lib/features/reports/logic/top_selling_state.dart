import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skeleton_mobile_app/core/networking/api_error_model.dart';
import 'package:skeleton_mobile_app/features/reports/domain/entities/top_selling_entity.dart';

part 'top_selling_state.freezed.dart';

@freezed
class TopSellingState with _$TopSellingState {
  const factory TopSellingState.initial() = _Initial;
  const factory TopSellingState.loading() = _Loading;
  const factory TopSellingState.success(List<TopSellingEntity> data) = _Success;
  const factory TopSellingState.error(ApiErrorModel error) = _Error;
}
