import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/networking/api_error_handler.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/core/networking/api_service.dart';
import 'package:skeleton_mobile_app/features/reports/data/data_source/remote/reports_sales_remote_data_source.dart';
import 'package:skeleton_mobile_app/features/reports/data/models/reports_sales_dto.dart';

@Injectable(as: ReportsSalesRemoteDataSource)
class ReportsSalesRemoteDataSourceImpl extends ReportsSalesRemoteDataSource {
  final ApiService apiService;

  ReportsSalesRemoteDataSourceImpl(this.apiService);

  @override
  Future<ApiResult<ReportsSalesDto>> getReportsSales(String period, int storeId) async {
    try {
      final response = await apiService.getReportsSales(period, storeId);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
