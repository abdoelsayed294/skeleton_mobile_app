import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/product_details/data/model/product_details_dto.dart';

abstract class ProductDetailsRemoteDataSource {
  Future<ApiResult<ProductActivityDto>> getProductActivity(int id);
  Future<ApiResult<ProductHeaderDto>> getProductHeader(int id);
  Future<ApiResult<ProductPricingDto>> getProductPricing(int id);
  Future<ApiResult<ProductInventoryDto>> getProductInventory(int id);
  Future<ApiResult<ProductSalesHistoryDto>> getProductSalesHistory(
    int id,
    String period,
    int storeId,
  );
}
