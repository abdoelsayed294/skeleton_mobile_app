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
import 'package:skeleton_mobile_app/features/profit_details/data/model/profit_summary_dto.dart';
import 'package:skeleton_mobile_app/features/profit_details/data/model/profit_weekly_chart_dto.dart';
import 'package:skeleton_mobile_app/features/purchases/data/model/purchases_dto.dart';
import 'package:skeleton_mobile_app/features/product_details/data/model/product_details_dto.dart';

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
    @Query('take') int take,
    @Query('all') bool all,
  );

  @GET(EndPoints.dashboardLowStock)
  Future<LowStockResponseDto> getLowStock(@Query('storeId') int storeId);

  @GET(EndPoints.inventorySummary)
  Future<InventorySummaryResponseDto> getInventorySummary(
    @Query('storeId') int storeId,
    @Query('itemType') String? itemType,
  );

  @GET(EndPoints.reportsTopSelling)
  Future<List<TopSellingDto>> getReportsTopSelling(
    @Query('take') int take,
    @Query('period') String period,
    @Query('storeId') int storeId,
    @Query('year') int year,
    @Query('month') int month,
  );

  @GET(EndPoints.reportsSales)
  Future<ReportsSalesDto> getReportsSales(
    @Query('period') String period,
    @Query('storeId') int storeId,
    @Query('year') int year,
    @Query('month') int month,
  );

  @GET(EndPoints.reportsRecentTransactions)
  Future<List<RecentTransactionDto>> getRecentTransactions(
    @Query('take') int take,
    @Query('storeId') int storeId,
    @Query('year') int year,
    @Query('month') int month,
  );

  @GET(EndPoints.todaySales)
  Future<TodaySalesDto> getTodaySales(
    @Query('storeId') int storeId,
    @Query('date') String date,
  );

  @GET(EndPoints.todaySalesRecentTransactions)
  Future<List<TodayRecentTransactionDto>> getTodaySalesRecentTransactions(
    @Query('date') String date,
    @Query('storeId') int storeId,
    @Query('take') int take,
    @Query('all') bool all,
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

  @GET(EndPoints.profitSummary)
  Future<ProfitSummaryDto> getProfitSummary(
    @Query('period') String period,
    @Query('storeId') int storeId,
    @Query('date') String? date,
  );

  @GET(EndPoints.profitWeeklyChart)
  Future<ProfitWeeklyChartDto> getProfitWeeklyChart(
    @Query('storeId') int storeId,
  );

  @GET(EndPoints.purchasesSummary)
  Future<PurchasesSummaryDto> getPurchasesSummary(
    @Query('storeId') int storeId,
    @Query('year') int year,
    @Query('month') int month,
  );

  @GET(EndPoints.purchasesRecent)
  Future<PurchasesRecentDto> getPurchasesRecent(
    @Query('storeId') int storeId,
    @Query('year') int year,
    @Query('month') int month,
    @Query('take') int take,
  );

  @GET(EndPoints.productActivity)
  Future<ProductActivityDto> getProductActivity(@Path('id') int id);

  @GET(EndPoints.productHeader)
  Future<ProductHeaderDto> getProductHeader(@Path('id') int id);

  @GET(EndPoints.productPricing)
  Future<ProductPricingDto> getProductPricing(@Path('id') int id);

  @GET(EndPoints.productInventory)
  Future<ProductInventoryDto> getProductInventory(@Path('id') int id);

  @GET(EndPoints.productSalesHistory)
  Future<ProductSalesHistoryDto> getProductSalesHistory(
    @Path('id') int id,
    @Query('period') String period,
    @Query('storeId') int storeId,
  );
}
