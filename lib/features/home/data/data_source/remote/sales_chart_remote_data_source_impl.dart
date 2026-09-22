import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/networking/api_error_handler.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/core/networking/api_service.dart';
import 'package:skeleton_mobile_app/features/home/data/data_source/remote/sales_chart_remote_data_source.dart';
import 'package:skeleton_mobile_app/features/home/data/models/sales_chart_dto.dart';

@Injectable(as: SalesChartRemoteDataSource)
class SalesChartRemoteDataSourceImpl extends SalesChartRemoteDataSource {
  final ApiService apiService;
  SalesChartRemoteDataSourceImpl(this.apiService);

  @override
  Future<ApiResult<List<SalesChartDto>>> getSalesChart(
    int storeId,
    String period,
    int days,
  ) async {
    try {
      final response = await apiService.getSalesChart(storeId, period, days);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  
}