import 'package:skeleton_mobile_app/core/networking/api_error_handler.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/core/networking/api_service.dart';
import 'package:skeleton_mobile_app/features/home/data/data_source/remote/low_stock_remote_data_source.dart';
import 'package:skeleton_mobile_app/features/home/data/models/low_stock_response_dto.dart';

class LowStockRemoteDataSourceImpl extends LowStockRemoteDataSource {
  final ApiService apiService;

  LowStockRemoteDataSourceImpl(this.apiService);

  @override
  Future<ApiResult<LowStockResponseDto>> getLowStock(int storeId) async {
    try {
      final response = await apiService.getLowStock(storeId);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}