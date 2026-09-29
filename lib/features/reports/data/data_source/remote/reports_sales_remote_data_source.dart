import 'package:skeleton/core/networking/api_result.dart';
import 'package:skeleton/features/reports/data/models/reports_sales_dto.dart';

abstract class ReportsSalesRemoteDataSource {
  Future<ApiResult<ReportsSalesDto>> getReportsSales(
    String period,
    int storeId,
    int year,
    int month,
  );
}
