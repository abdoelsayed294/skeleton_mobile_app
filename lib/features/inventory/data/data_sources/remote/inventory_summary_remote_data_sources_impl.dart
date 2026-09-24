import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/networking/api_error_handler.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/core/networking/api_service.dart';
import 'package:skeleton_mobile_app/features/inventory/data/data_sources/remote/inventory_summary_remote_data_sources.dart';
import 'package:skeleton_mobile_app/features/inventory/data/model/inventory_summary_response_dto.dart';
import 'package:skeleton_mobile_app/features/inventory/data/model/inventroy_product_response_dto.dart';

@Injectable(as: InventorySummaryRemoteDataSource)
class InventorySummaryRemoteDataSourcesImpl
    implements InventorySummaryRemoteDataSource {
  final ApiService _apiService;
  InventorySummaryRemoteDataSourcesImpl(this._apiService);
  @override
  Future<ApiResult<InventorySummaryResponseDto>> getInventorySummary(
    int storeId, {
    String? itemType,
  }) async {
    try {
      final response = await _apiService.getInventorySummary(storeId, itemType);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResult<InventroyProductResponseDto>> getInventoryProducts(
    int storeId,
    String? itemType,
    int pageNumber,
    int pageSize, {
    String? search,
    String? status,
    String? sortBy,
  }) async {
    try {
      final response = await _apiService.getInventoryProducts(
        storeId,
        itemType,
        search,
        status,
        pageNumber,
        pageSize,
        sortBy,
      );

      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
