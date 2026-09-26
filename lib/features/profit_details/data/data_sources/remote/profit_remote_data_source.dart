import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/profit_details/data/model/profit_summary_dto.dart';
import 'package:skeleton_mobile_app/features/profit_details/data/model/profit_weekly_chart_dto.dart';

abstract class ProfitRemoteDataSource {
  Future<ApiResult<ProfitSummaryDto>> getProfitSummary(
    String period,
    int storeId, {
    String? date,
  });
  Future<ApiResult<ProfitWeeklyChartDto>> getProfitWeeklyChart(int storeId);
}
