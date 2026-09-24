import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/inventory/domain/entity/inventroy_product_response.dart';
import 'package:skeleton_mobile_app/features/inventory/domain/repo/inventory_summary_repo.dart';

@injectable
class InventoryProudctUseCase {
  final InventorySummaryRepo _inventorySummaryRepo;
  InventoryProudctUseCase(this._inventorySummaryRepo);
  Future<ApiResult<InventroyProductResponse>> invoke(
    int storeId,
    String? itemType,
    int pageNumber,
    int pageSize, {
    String? search,
    String? status,
    String? sortBy,
  }) async {
    return _inventorySummaryRepo.getInventoryProducts(
      storeId,
      itemType,
      pageNumber,
      pageSize,
      search: search,
      status: status,
      sortBy: sortBy,
    );
  }
}
