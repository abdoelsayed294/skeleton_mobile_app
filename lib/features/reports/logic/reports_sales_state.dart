import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skeleton_mobile_app/core/networking/api_error_model.dart';
import 'package:skeleton_mobile_app/features/reports/domain/entities/reports_sales_entity.dart';

part 'reports_sales_state.freezed.dart';

@freezed
class ReportsSalesState with _$ReportsSalesState {
  const factory ReportsSalesState.initial() = _Initial;
  const factory ReportsSalesState.loading() = _Loading;
  const factory ReportsSalesState.success(ReportsSalesEntity data) = _Success;
  const factory ReportsSalesState.error(ApiErrorModel error) = _Error;
}
