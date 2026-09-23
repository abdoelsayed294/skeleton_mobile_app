import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:skeleton_mobile_app/core/networking/api_constants.dart';
import 'package:skeleton_mobile_app/features/home/data/models/low_stock_response_dto.dart';
import 'package:skeleton_mobile_app/features/home/data/models/sales_chart_response_dto.dart';
import 'package:skeleton_mobile_app/features/home/data/models/summary_response_dto.dart';
import 'package:skeleton_mobile_app/features/home/data/models/top_products_dto.dart';
import 'package:skeleton_mobile_app/features/reports/data/models/recent_transaction_dto.dart';
import 'package:skeleton_mobile_app/features/reports/data/models/reports_sales_dto.dart';
import 'package:skeleton_mobile_app/features/reports/data/models/top_selling_dto.dart';
import 'package:skeleton_mobile_app/features/inventory/data/model/inventory_summary_response_dto.dart';
import 'package:skeleton_mobile_app/features/inventory/data/model/inventroy_product_response_dto.dart';
import 'package:skeleton_mobile_app/features/scan_qr/data/model/qr_response_dto.dart';
import 'package:skeleton_mobile_app/features/today_sales/data/models/today_recent_transaction_dto.dart';
import 'package:skeleton_mobile_app/features/today_sales/data/models/today_sales_dto.dart';

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
  Future<SalesChartResponseDto> getSalesChart(
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
  Future<LowStockResponseDto> getLowStock(@Query('storeId') int storeId);

  @GET(EndPoints.inventorySummary)
  Future<InventorySummaryResponseDto> getInventorySummary(
    @Query('storeId') int storeId,
  );

  @GET(EndPoints.reportsTopSelling)
  Future<List<TopSellingDto>> getReportsTopSelling(
    @Query('take') int take,
    @Query('period') String period,
    @Query('storeId') int storeId,
  );

  @GET(EndPoints.reportsSales)
  Future<ReportsSalesDto> getReportsSales(
    @Query('period') String period,
    @Query('storeId') int storeId,
  );

  @GET(EndPoints.reportsRecentTransactions)
  Future<List<RecentTransactionDto>> getRecentTransactions(
    @Query('take') int take,
    @Query('period') String period,
    @Query('storeId') int storeId,
  );

  @GET(EndPoints.todaySales)
  Future<TodaySalesDto> getTodaySales(
    @Query('storeId') int storeId,
  );

  @GET(EndPoints.todaySalesRecentTransactions)
  Future<List<TodayRecentTransactionDto>> getTodaySalesRecentTransactions(
    @Query('take') int take,
    @Query('period') String period,
    @Query('storeId') int storeId,
  );
  
  @GET(EndPoints.inventoryProducts)
  Future<InventroyProductResponseDto> getInventoryProducts(
    @Query('storeId') int storeId,
    @Query('itemType') String? itemType,
    @Query('search') String? search,
    @Query('status') String? status,
    @Query('page') int page,
    @Query('pageSize') int pageSize,
    @Query('sortBy') String? sortBy,
  );
}
