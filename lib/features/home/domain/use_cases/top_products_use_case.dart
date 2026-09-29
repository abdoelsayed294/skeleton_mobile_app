import 'package:injectable/injectable.dart';
import 'package:skeleton/core/networking/api_result.dart';
import 'package:skeleton/features/home/domain/entities/top_product_entity.dart';
import 'package:skeleton/features/home/domain/repo/home_repo.dart';

@injectable
class TopProductsUseCase {
  final HomeRepo _homeRepo;

  TopProductsUseCase(this._homeRepo);

  Future<ApiResult<List<TopProductEntity>>> getTopProducts(
    int storeId,
    int take,
    bool all,
  ) {
    return _homeRepo.getTopProducts(storeId, take, all);
  }
}
