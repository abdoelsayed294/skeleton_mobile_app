import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/product_details/domain/entity/product_details_entities.dart';
import 'package:skeleton_mobile_app/features/product_details/domain/repo/product_details_repo.dart';

@injectable
class GetProductInventoryUseCase {
  final ProductDetailsRepo _repo;
  GetProductInventoryUseCase(this._repo);

  Future<ApiResult<ProductInventoryEntity>> invoke(int id) =>
      _repo.getProductInventory(id);
}
