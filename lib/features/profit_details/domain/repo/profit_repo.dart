import 'package:skeleton/core/networking/api_result.dart';
import 'package:skeleton/features/profit_details/domain/entity/profit_summary.dart';
import 'package:skeleton/features/profit_details/domain/entity/profit_weekly_chart.dart';

abstract class ProfitRepo {
  Future<ApiResult<ProfitSummary>> getProfitSummary(
    String period,
    int storeId, {
    String? date,
  });
  Future<ApiResult<ProfitWeeklyChart>> getProfitWeeklyChart(int storeId);
}
