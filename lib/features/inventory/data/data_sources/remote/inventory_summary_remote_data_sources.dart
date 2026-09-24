import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/inventory/data/model/inventory_summary_response_dto.dart';
import 'package:skeleton_mobile_app/features/inventory/data/model/inventroy_product_response_dto.dart';

abstract class InventorySummaryRemoteDataSource {
  Future<ApiResult<InventorySummaryResponseDto>> getInventorySummary(
    int storeId, {
    String? itemType,
  });
  Future<ApiResult<InventroyProductResponseDto>> getInventoryProducts(
    int storeId,
    String? itemType,
    int pageNumber,
    int pageSize, {
    String? search,
    String? status,
    String? sortBy,
  });
}
