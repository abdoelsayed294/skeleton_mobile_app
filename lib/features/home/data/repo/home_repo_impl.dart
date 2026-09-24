import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/networking/api_error_handler.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/home/data/data_source/remote/low_stock_remote_data_source.dart';
import 'package:skeleton_mobile_app/features/home/data/data_source/remote/sales_chart_remote_data_source.dart';
import 'package:skeleton_mobile_app/features/home/data/data_source/remote/summary_remote_data_source.dart';
import 'package:skeleton_mobile_app/features/home/data/data_source/remote/top_products_remote_data_source.dart';
import 'package:skeleton_mobile_app/features/home/data/mappers/low_stock_mapper.dart';
import 'package:skeleton_mobile_app/features/home/data/mappers/sales_chart_mapper.dart';
import 'package:skeleton_mobile_app/features/home/data/mappers/summary_mapper.dart';
import 'package:skeleton_mobile_app/features/home/data/mappers/top_products_mapper.dart';
import 'package:skeleton_mobile_app/features/home/domain/entities/low_stock_response.dart';
import 'package:skeleton_mobile_app/features/home/domain/entities/sales_chart_response.dart';
import 'package:skeleton_mobile_app/features/home/domain/entities/summary_response.dart';
import 'package:skeleton_mobile_app/features/home/domain/entities/top_product_entity.dart';
import 'package:skeleton_mobile_app/features/home/domain/repo/home_repo.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl extends HomeRepo {
  final SummaryRemoteDataSource summaryRemoteDataSource;
  final SalesChartRemoteDataSource salesChartRemoteDataSource;
  final TopProductsRemoteDataSource topProductsRemoteDataSource;
  final LowStockRemoteDataSource lowStockRemoteDataSource;

  HomeRepoImpl(
    this.summaryRemoteDataSource,
    this.salesChartRemoteDataSource,
    this.topProductsRemoteDataSource,
    this.lowStockRemoteDataSource,
  );

  @override
  Future<ApiResult<SummaryResponse>> getSummary(
    int storeId,
    String date,
  ) async {
    final response = await summaryRemoteDataSource.getSummary(storeId, date);
    return response.when(
      success: (data) => ApiResult.success(data.toEntity()),
      failure: (error) => ApiResult.failure(ApiErrorHandler.handle(error)),
    );
  }

  @override
  Future<ApiResult<SalesChartResponse>> getSalesChart(
    int storeId,
    String period,
    int days,
  ) async {
    final response = await salesChartRemoteDataSource.getSalesChart(
      storeId,
      period,
      days,
    );
    return response.when(
      success: (data) => ApiResult.success(data.toEntity()),
      failure: (error) => ApiResult.failure(ApiErrorHandler.handle(error)),
    );
  }

  @override
  Future<ApiResult<List<TopProductEntity>>> getTopProducts(
    int storeId,
    int take,
    bool all,
  ) async {
    final response = await topProductsRemoteDataSource.getTopProducts(
      storeId,
      take,
      all,
    );
    return response.when(
      success: (data) =>
          ApiResult.success(data.map((e) => e.toEntity()).toList()),
      failure: (error) => ApiResult.failure(ApiErrorHandler.handle(error)),
    );
  }

  @override
  Future<ApiResult<LowStockResponse>> getLowStock(int storeId) async {
    final response = await lowStockRemoteDataSource.getLowStock(storeId);
    return response.when(
      success: (data) => ApiResult.success(data.toEntity()),
      failure: (error) => ApiResult.failure(ApiErrorHandler.handle(error)),
    );
  }
}
