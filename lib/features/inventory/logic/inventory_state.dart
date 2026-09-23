import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skeleton_mobile_app/core/networking/api_error_model.dart';
part 'inventory_state.freezed.dart';

@freezed
abstract class InventoryState<T> with _$InventoryState<T> {
  const factory InventoryState.initial() = _Initial;
  const factory InventoryState.loading() = Loading;
  const factory InventoryState.success(T data) = Success;
  const factory InventoryState.error(ApiErrorModel apiErrorModel) = Error;
}
