import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:skeleton_mobile_app/core/networking/api_constants.dart';
import 'package:skeleton_mobile_app/features/home/data/models/low_stock_response_dto.dart';
import 'package:skeleton_mobile_app/features/home/data/models/sales_chart_dto.dart';
import 'package:skeleton_mobile_app/features/home/data/models/summary_response_dto.dart';
import 'package:skeleton_mobile_app/features/home/data/models/top_products_dto.dart';
import 'package:skeleton_mobile_app/features/scan_qr/data/model/qr_response_dto.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) = _ApiService;
  @GET(EndPoints.qrStatus)
  Future<QrResponseDto> getQrStatus(@Path('qrToken') String token);

  @GET(EndPoints.dashboardSummary)
  Future<SummaryResponseDto> getSummary(
    @Query('storeId') int storeId,
    @Query('date') String? date,
  );

  @GET(EndPoints.dashboardSalesChart)
Future<List<SalesChartDto>> getSalesChart(
  @Query('storeId') int storeId,
  @Query('period') String period,
  @Query('days') int days,
);

  @GET(EndPoints.dashboardTopProducts)
  Future<List<TopProductDto>> getTopProducts(
    @Query('storeId') int storeId,
    @Query('take') int days,
  );

  @GET(EndPoints.dashboardLowStock)
  Future<LowStockResponseDto> getLowStock(
    @Query('storeId') int storeId
  );
}
