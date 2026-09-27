import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/networking/api_error_handler.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/reports/data/data_source/remote/recent_transaction_remote_data_source.dart';
import 'package:skeleton_mobile_app/features/reports/data/data_source/remote/reports_sales_remote_data_source.dart';
import 'package:skeleton_mobile_app/features/reports/data/data_source/remote/top_selling_remote_data_source.dart';
import 'package:skeleton_mobile_app/features/reports/data/mappers/recent_transaction_mapper.dart';
import 'package:skeleton_mobile_app/features/reports/data/mappers/reports_sales_mapper.dart';
import 'package:skeleton_mobile_app/features/reports/data/mappers/top_selling_mapper.dart';
import 'package:skeleton_mobile_app/features/reports/domain/entities/recent_transaction_entity.dart';
import 'package:skeleton_mobile_app/features/reports/domain/entities/reports_sales_entity.dart';
import 'package:skeleton_mobile_app/features/reports/domain/entities/top_selling_entity.dart';
import 'package:skeleton_mobile_app/features/reports/domain/repo/reports_repo.dart';

@Injectable(as: ReportsRepo)
class ReportsRepoImpl extends ReportsRepo {
  final TopSellingRemoteDataSource topSellingRemoteDataSource;
  final ReportsSalesRemoteDataSource reportsSalesRemoteDataSource;
  final RecentTransactionRemoteDataSource recentTransactionRemoteDataSource;

  ReportsRepoImpl(
    this.topSellingRemoteDataSource,
    this.reportsSalesRemoteDataSource,
    this.recentTransactionRemoteDataSource,
  );

  @override
  Future<ApiResult<List<TopSellingEntity>>> getTopSelling(
    int storeId,
    String period,
    int take,
    int year,
    int month,
  ) async {
    final response = await topSellingRemoteDataSource.getTopSelling(
      storeId,
      period,
      take,
      year,
      month,
    );
    return response.when(
      success: (data) =>
          ApiResult.success(data.map((e) => e.toEntity()).toList()),
      failure: (error) => ApiResult.failure(ApiErrorHandler.handle(error)),
    );
  }

  @override
  Future<ApiResult<ReportsSalesEntity>> getReportsSales(
    String period,
    int storeId,
    int year,
    int month,
  ) async {
    final response = await reportsSalesRemoteDataSource.getReportsSales(
      period,
      storeId,
      year,
      month,
    );
    return response.when(
      success: (data) => ApiResult.success(data.toEntity()),
      failure: (error) => ApiResult.failure(ApiErrorHandler.handle(error)),
    );
  }

  @override
  Future<ApiResult<List<RecentTransactionEntity>>> getRecentTransactions(
    int storeId,
    int take,
    int year,
    int month,
  ) async {
    final response = await recentTransactionRemoteDataSource
        .getRecentTransactions(storeId, take, year, month);
    return response.when(
      success: (data) =>
          ApiResult.success(data.map((e) => e.toEntity()).toList()),
      failure: (error) => ApiResult.failure(ApiErrorHandler.handle(error)),
    );
  }
}
