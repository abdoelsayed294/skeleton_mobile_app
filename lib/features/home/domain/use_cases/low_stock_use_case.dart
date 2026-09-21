import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/home/domain/entities/low_stock_response.dart';
import 'package:skeleton_mobile_app/features/home/domain/repo/home_repo.dart';

class LowStockUseCase {
  final HomeRepo _homeRepo;

  LowStockUseCase(this._homeRepo);

  Future<ApiResult<LowStockResponse>> getLowStock(int storeId) {
    return _homeRepo.getLowStock(storeId);
  }
}