import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/product_details/domain/entity/product_details_entities.dart';
import 'package:skeleton_mobile_app/features/product_details/domain/repo/product_details_repo.dart';

@injectable
class GetProductPricingUseCase {
  final ProductDetailsRepo _repo;
  GetProductPricingUseCase(this._repo);

  Future<ApiResult<ProductPricingEntity>> invoke(int id) =>
      _repo.getProductPricing(id);
}
