import 'package:skeleton/core/networking/api_result.dart';
import 'package:skeleton/features/home/data/models/low_stock_response_dto.dart';

abstract class LowStockRemoteDataSource {
  Future<ApiResult<LowStockResponseDto>> getLowStock(int storeId);
}
