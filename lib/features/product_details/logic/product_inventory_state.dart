import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skeleton_mobile_app/core/networking/api_error_model.dart';
import 'package:skeleton_mobile_app/features/product_details/domain/entity/product_details_entities.dart';

part 'product_inventory_state.freezed.dart';

@freezed
class ProductInventoryState with _$ProductInventoryState {
  const factory ProductInventoryState.initial() = _Initial;
  const factory ProductInventoryState.loading() = _Loading;
  const factory ProductInventoryState.success(ProductInventoryEntity data) =
      _Success;
  const factory ProductInventoryState.error(ApiErrorModel error) = _Error;
}
