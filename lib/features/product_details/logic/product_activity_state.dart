import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skeleton_mobile_app/core/networking/api_error_model.dart';
import 'package:skeleton_mobile_app/features/product_details/domain/entity/product_details_entities.dart';

part 'product_activity_state.freezed.dart';

@freezed
class ProductActivityState with _$ProductActivityState {
  const factory ProductActivityState.initial() = _Initial;
  const factory ProductActivityState.loading() = _Loading;
  const factory ProductActivityState.success(ProductActivityEntity data) =
      _Success;
  const factory ProductActivityState.error(ApiErrorModel error) = _Error;
}
