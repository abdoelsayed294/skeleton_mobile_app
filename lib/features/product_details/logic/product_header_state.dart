import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skeleton_mobile_app/core/networking/api_error_model.dart';
import 'package:skeleton_mobile_app/features/product_details/domain/entity/product_details_entities.dart';

part 'product_header_state.freezed.dart';

@freezed
class ProductHeaderState with _$ProductHeaderState {
  const factory ProductHeaderState.initial() = _Initial;
  const factory ProductHeaderState.loading() = _Loading;
  const factory ProductHeaderState.success(ProductHeaderEntity data) = _Success;
  const factory ProductHeaderState.error(ApiErrorModel error) = _Error;
}
