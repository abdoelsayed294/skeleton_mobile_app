import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/inventory/domain/entity/inventory_summary_response.dart';
import 'package:skeleton_mobile_app/features/inventory/domain/entity/inventroy_product_response.dart';

abstract class InventorySummaryRepo {
  Future<ApiResult<InventorySummaryResponse>> getInventorySummary(
    int storeId, {
    String? itemType,
  });
  Future<ApiResult<InventroyProductResponse>> getInventoryProducts(
    int storeId,
    String? itemType,
    int pageNumber,
    int pageSize, {
    String? search,
    String? status,
    String? sortBy,
  });
}
