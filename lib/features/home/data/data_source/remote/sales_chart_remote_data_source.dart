import 'package:skeleton/core/networking/api_result.dart';
import 'package:skeleton/features/home/data/models/sales_chart_response_dto.dart';

abstract class SalesChartRemoteDataSource {
  Future<ApiResult<SalesChartResponseDto>> getSalesChart(
    int storeId,
    String period,
    int days,
  );
}
