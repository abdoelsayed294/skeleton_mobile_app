import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/product_details/data/data_sources/remote/product_details_remote_data_source.dart';
import 'package:skeleton_mobile_app/features/product_details/data/mappers/product_details_mapper.dart';
import 'package:skeleton_mobile_app/features/product_details/domain/entity/product_details_entities.dart';
import 'package:skeleton_mobile_app/features/product_details/domain/repo/product_details_repo.dart';

@Injectable(as: ProductDetailsRepo)
class ProductDetailsRepoImpl implements ProductDetailsRepo {
  final ProductDetailsRemoteDataSource _remote;

  ProductDetailsRepoImpl(this._remote);

  @override
  Future<ApiResult<ProductActivityEntity>> getProductActivity(int id) async {
    final result = await _remote.getProductActivity(id);
    return result.when(
      success: (data) => ApiResult.success(data.toEntity()),
      failure: (error) => ApiResult.failure(error),
    );
  }

  @override
  Future<ApiResult<ProductHeaderEntity>> getProductHeader(int id) async {
    final result = await _remote.getProductHeader(id);
    return result.when(
      success: (data) => ApiResult.success(data.toEntity()),
      failure: (error) => ApiResult.failure(error),
    );
  }

  @override
  Future<ApiResult<ProductPricingEntity>> getProductPricing(int id) async {
    final result = await _remote.getProductPricing(id);
    return result.when(
      success: (data) => ApiResult.success(data.toEntity()),
      failure: (error) => ApiResult.failure(error),
    );
  }

  @override
  Future<ApiResult<ProductInventoryEntity>> getProductInventory(int id) async {
    final result = await _remote.getProductInventory(id);
    return result.when(
      success: (data) => ApiResult.success(data.toEntity()),
      failure: (error) => ApiResult.failure(error),
    );
  }

  @override
  Future<ApiResult<ProductSalesHistoryEntity>> getProductSalesHistory(
    int id,
    String period,
    int storeId,
  ) async {
    final result = await _remote.getProductSalesHistory(id, period, storeId);
    return result.when(
      success: (data) => ApiResult.success(data.toEntity()),
      failure: (error) => ApiResult.failure(error),
    );
  }
}
