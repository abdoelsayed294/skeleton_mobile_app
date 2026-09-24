import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/networking/api_error_handler.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/core/networking/api_service.dart';
import 'package:skeleton_mobile_app/features/home/data/data_source/remote/top_products_remote_data_source.dart';
import 'package:skeleton_mobile_app/features/home/data/models/top_products_dto.dart';

@Injectable(as: TopProductsRemoteDataSource)
class TopProductsRemoteDataSourceImpl extends TopProductsRemoteDataSource {
  final ApiService apiService;
  TopProductsRemoteDataSourceImpl(this.apiService);

  @override
  Future<ApiResult<List<TopProductDto>>> getTopProducts(
    int storeId,
    int take,
    bool all,
  ) async {
    try {
      final response = await apiService.getTopProducts(storeId, take, all);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
