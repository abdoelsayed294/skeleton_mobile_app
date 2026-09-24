import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/product_details/domain/entity/product_details_entities.dart';
import 'package:skeleton_mobile_app/features/product_details/domain/repo/product_details_repo.dart';

@injectable
class GetProductHeaderUseCase {
  final ProductDetailsRepo _repo;
  GetProductHeaderUseCase(this._repo);

  Future<ApiResult<ProductHeaderEntity>> invoke(int id) =>
      _repo.getProductHeader(id);
}
