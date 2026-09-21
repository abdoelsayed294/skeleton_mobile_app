import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/home/data/models/sales_chart_dto.dart';

abstract class SalesChartRemoteDataSource {
  Future<ApiResult<List<SalesChartDto>>> getSalesChart(int storeId, String period, int days);
}