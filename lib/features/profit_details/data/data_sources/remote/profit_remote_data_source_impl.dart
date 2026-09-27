import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/networking/api_error_handler.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/core/networking/api_service.dart';
import 'package:skeleton_mobile_app/features/profit_details/data/data_sources/remote/profit_remote_data_source.dart';
import 'package:skeleton_mobile_app/features/profit_details/data/model/profit_summary_dto.dart';
import 'package:skeleton_mobile_app/features/profit_details/data/model/profit_weekly_chart_dto.dart';

@Injectable(as: ProfitRemoteDataSource)
class ProfitRemoteDataSourceImpl implements ProfitRemoteDataSource {
  final ApiService _apiService;
  ProfitRemoteDataSourceImpl(this._apiService);
  @override
  Future<ApiResult<ProfitSummaryDto>> getProfitSummary(
    String period,
    int storeId, {
    String? date,
  }) async {
    try {
      return ApiResult.success(
        await _apiService.getProfitSummary(period, storeId, date),
      );
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResult<ProfitWeeklyChartDto>> getProfitWeeklyChart(
    int storeId,
  ) async {
    try {
      return ApiResult.success(await _apiService.getProfitWeeklyChart(storeId));
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
