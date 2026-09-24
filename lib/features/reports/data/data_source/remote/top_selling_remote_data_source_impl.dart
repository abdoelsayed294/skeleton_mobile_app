import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/networking/api_error_handler.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/core/networking/api_service.dart';
import 'package:skeleton_mobile_app/features/reports/data/data_source/remote/top_selling_remote_data_source.dart';
import 'package:skeleton_mobile_app/features/reports/data/models/top_selling_dto.dart';

@Injectable(as: TopSellingRemoteDataSource)
class TopSellingRemoteDataSourceImpl extends TopSellingRemoteDataSource {
  final ApiService apiService;

  TopSellingRemoteDataSourceImpl(this.apiService);

  @override
  Future<ApiResult<List<TopSellingDto>>> getTopSelling(
    int storeId,
    String period,
    int take,
    int year,
    int month,
  ) async {
    try {
      final response = await apiService.getReportsTopSelling(
        take,
        period,
        storeId,
        year,
        month,
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
