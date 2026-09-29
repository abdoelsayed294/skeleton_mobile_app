import 'package:injectable/injectable.dart';
import 'package:skeleton/core/networking/api_result.dart';
import 'package:skeleton/features/home/domain/entities/low_stock_response.dart';
import 'package:skeleton/features/home/domain/repo/home_repo.dart';

@injectable
class LowStockUseCase {
  final HomeRepo _homeRepo;

  LowStockUseCase(this._homeRepo);

  Future<ApiResult<LowStockResponse>> getLowStock(int storeId) {
    return _homeRepo.getLowStock(storeId);
  }
}
