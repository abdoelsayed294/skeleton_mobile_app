import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/reports/domain/entities/recent_transaction_entity.dart';
import 'package:skeleton_mobile_app/features/reports/domain/entities/reports_sales_entity.dart';
import 'package:skeleton_mobile_app/features/reports/domain/entities/top_selling_entity.dart';

abstract class ReportsRepo {
  Future<ApiResult<List<TopSellingEntity>>> getTopSelling(
    int storeId,
    String period,
    int take,
    int year,
    int month,
  );
  Future<ApiResult<ReportsSalesEntity>> getReportsSales(
    String period,
    int storeId,
    int year,
    int month,
  );
  Future<ApiResult<List<RecentTransactionEntity>>> getRecentTransactions(
    int storeId,
    String period,
    int take,
    int year,
    int month,
  );
}
