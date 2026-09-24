import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/inventory/data/data_sources/remote/inventory_summary_remote_data_sources.dart';
import 'package:skeleton_mobile_app/features/inventory/data/mappers/Inventroy_maaper.dart';
import 'package:skeleton_mobile_app/features/inventory/domain/entity/inventory_summary_response.dart';
import 'package:skeleton_mobile_app/features/inventory/domain/entity/inventroy_product_response.dart';
import 'package:skeleton_mobile_app/features/inventory/domain/repo/inventory_summary_repo.dart';

@Injectable(as: InventorySummaryRepo)
class InventorySummaryRepoImpl implements InventorySummaryRepo {
  final InventorySummaryRemoteDataSource _inventorySummaryRemoteDataSource;
  InventorySummaryRepoImpl(this._inventorySummaryRemoteDataSource);
  @override
  Future<ApiResult<InventorySummaryResponse>> getInventorySummary(
    int storeId, {
    String? itemType,
  }) async {
    final result = await _inventorySummaryRemoteDataSource.getInventorySummary(
      storeId,
      itemType: itemType,
    );
    return result.when(
      success: (data) => ApiResult.success(data.toEntity()),
      failure: (error) => ApiResult.failure(error),
    );
  }

  @override
  Future<ApiResult<InventroyProductResponse>> getInventoryProducts(
    int storeId,
    String? itemType,
    int pageNumber,
    int pageSize, {
    String? search,
    String? status,
    String? sortBy,
  }) async {
    final result = await _inventorySummaryRemoteDataSource.getInventoryProducts(
      storeId,
      itemType,
      pageNumber,
      pageSize,
      search: search,
      status: status,
      sortBy: sortBy,
    );
    return result.when(
      success: (data) => ApiResult.success(data.toEntity()),
      failure: (error) => ApiResult.failure(error),
    );
  }
}
