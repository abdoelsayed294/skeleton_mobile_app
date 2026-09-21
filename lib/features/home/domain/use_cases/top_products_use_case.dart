import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/home/domain/entities/top_product_entity.dart';
import 'package:skeleton_mobile_app/features/home/domain/repo/home_repo.dart';

class TopProductsUseCase {
  final HomeRepo _homeRepo;

  TopProductsUseCase(this._homeRepo);

  Future<ApiResult<List<TopProductEntity>>> getTopProducts(int storeId, int take) {
    return _homeRepo.getTopProducts(storeId, take);
  }
}