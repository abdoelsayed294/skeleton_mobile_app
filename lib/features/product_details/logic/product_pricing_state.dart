import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skeleton_mobile_app/core/networking/api_error_model.dart';
import 'package:skeleton_mobile_app/features/product_details/domain/entity/product_details_entities.dart';

part 'product_pricing_state.freezed.dart';

@freezed
class ProductPricingState with _$ProductPricingState {
  const factory ProductPricingState.initial() = _Initial;
  const factory ProductPricingState.loading() = _Loading;
  const factory ProductPricingState.success(ProductPricingEntity data) =
      _Success;
  const factory ProductPricingState.error(ApiErrorModel error) = _Error;
}
