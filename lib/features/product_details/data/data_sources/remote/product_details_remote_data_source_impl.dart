import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/networking/api_error_handler.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/core/networking/api_service.dart';
import 'package:skeleton_mobile_app/features/product_details/data/data_sources/remote/product_details_remote_data_source.dart';
import 'package:skeleton_mobile_app/features/product_details/data/model/product_details_dto.dart';

@Injectable(as: ProductDetailsRemoteDataSource)
class ProductDetailsRemoteDataSourceImpl
    implements ProductDetailsRemoteDataSource {
  final ApiService _apiService;

  ProductDetailsRemoteDataSourceImpl(this._apiService);

  @override
  Future<ApiResult<ProductActivityDto>> getProductActivity(int id) async {
    try {
      return ApiResult.success(await _apiService.getProductActivity(id));
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<ProductHeaderDto>> getProductHeader(int id) async {
    try {
      return ApiResult.success(await _apiService.getProductHeader(id));
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<ProductPricingDto>> getProductPricing(int id) async {
    try {
      return ApiResult.success(await _apiService.getProductPricing(id));
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<ProductInventoryDto>> getProductInventory(int id) async {
    try {
      return ApiResult.success(await _apiService.getProductInventory(id));
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<ProductSalesHistoryDto>> getProductSalesHistory(
    int id,
    String period,
    int storeId,
  ) async {
    try {
      return ApiResult.success(
        await _apiService.getProductSalesHistory(id, period, storeId),
      );
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
