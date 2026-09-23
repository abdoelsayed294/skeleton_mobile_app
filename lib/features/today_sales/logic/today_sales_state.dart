import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skeleton_mobile_app/core/networking/api_error_model.dart';
import 'package:skeleton_mobile_app/features/today_sales/domain/entities/today_sales_entity.dart';

part 'today_sales_state.freezed.dart';

@freezed
class TodaySalesState with _$TodaySalesState {
  const factory TodaySalesState.initial() = _Initial;
  const factory TodaySalesState.loading() = _Loading;
  const factory TodaySalesState.success(TodaySalesEntity data) = _Success;
  const factory TodaySalesState.error(ApiErrorModel error) = _Error;
}
