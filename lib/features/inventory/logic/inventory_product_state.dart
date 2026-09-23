import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skeleton_mobile_app/core/networking/api_error_model.dart';

part 'inventory_product_state.freezed.dart';

@freezed
abstract class InventoryProductState<T>
    with _$InventoryProductState<T> {
  const factory InventoryProductState.initial() =
      _Initial<T>;

  const factory InventoryProductState.loading() =
      Loading<T>;

  const factory InventoryProductState.success(T data) =
      Success<T>;

  const factory InventoryProductState.error(
    ApiErrorModel apiErrorModel,
  ) = Error<T>;
}
