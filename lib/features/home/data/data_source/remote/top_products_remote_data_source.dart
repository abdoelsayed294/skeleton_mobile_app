import 'package:skeleton/core/networking/api_result.dart';
import 'package:skeleton/features/home/data/models/top_products_dto.dart';

abstract class TopProductsRemoteDataSource {
  Future<ApiResult<List<TopProductDto>>> getTopProducts(
    int storeId,
    int take,
    bool all,
  );
}
