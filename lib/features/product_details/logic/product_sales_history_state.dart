import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skeleton_mobile_app/core/networking/api_error_model.dart';
import 'package:skeleton_mobile_app/features/product_details/domain/entity/product_details_entities.dart';

part 'product_sales_history_state.freezed.dart';

@freezed
class ProductSalesHistoryState with _$ProductSalesHistoryState {
  const factory ProductSalesHistoryState.initial() = _Initial;
  const factory ProductSalesHistoryState.loading() = _Loading;
  const factory ProductSalesHistoryState.success(
    ProductSalesHistoryEntity data,
  ) = _Success;
  const factory ProductSalesHistoryState.error(ApiErrorModel error) = _Error;
}
