import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skeleton_mobile_app/core/networking/api_error_model.dart';
part 'qr_state.freezed.dart';

@freezed
abstract class QrState<T> with _$QrState<T> {
  const factory QrState.initial() = _Initial;
  const factory QrState.loading() = Loading;
  const factory QrState.success(T data) = Success;
  const factory QrState.error(ApiErrorModel apiErrorModel) = Error;
}
