import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/product_details/domain/entity/product_details_entities.dart';

abstract class ProductDetailsRepo {
  Future<ApiResult<ProductActivityEntity>> getProductActivity(int id);
  Future<ApiResult<ProductHeaderEntity>> getProductHeader(int id);
  Future<ApiResult<ProductPricingEntity>> getProductPricing(int id);
  Future<ApiResult<ProductInventoryEntity>> getProductInventory(int id);
  Future<ApiResult<ProductSalesHistoryEntity>> getProductSalesHistory(
    int id,
    String period,
    int storeId,
  );
}
