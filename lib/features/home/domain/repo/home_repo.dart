import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/home/domain/entities/low_stock_response.dart';
import 'package:skeleton_mobile_app/features/home/domain/entities/sales_chart_entity.dart';
import 'package:skeleton_mobile_app/features/home/domain/entities/summary_response.dart';
import 'package:skeleton_mobile_app/features/home/domain/entities/top_product_entity.dart';


abstract class HomeRepo {
  Future<ApiResult<SummaryResponse>> getSummary(int storeId, String date);
  Future<ApiResult<List<SalesChartEntity>>> getSalesChart(int storeId, String period, int days);
  Future<ApiResult<List<TopProductEntity>>> getTopProducts(int storeId, int take);
  Future<ApiResult<LowStockResponse>> getLowStock(int storeId);
}