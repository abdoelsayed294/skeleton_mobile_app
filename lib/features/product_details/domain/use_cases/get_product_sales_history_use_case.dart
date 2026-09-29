import 'package:injectable/injectable.dart';
import 'package:skeleton/core/networking/api_result.dart';
import 'package:skeleton/features/product_details/domain/entity/product_details_entities.dart';
import 'package:skeleton/features/product_details/domain/repo/product_details_repo.dart';

@injectable
class GetProductSalesHistoryUseCase {
  final ProductDetailsRepo _repo;
  GetProductSalesHistoryUseCase(this._repo);

  Future<ApiResult<ProductSalesHistoryEntity>> invoke(
    int id,
    String period,
    int storeId,
  ) => _repo.getProductSalesHistory(id, period, storeId);
}
