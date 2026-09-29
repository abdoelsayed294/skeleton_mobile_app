import 'package:injectable/injectable.dart';
import 'package:skeleton/core/networking/api_result.dart';
import 'package:skeleton/features/profit_details/domain/entity/profit_weekly_chart.dart';
import 'package:skeleton/features/profit_details/domain/repo/profit_repo.dart';

@injectable
class GetProfitWeeklyChartUseCase {
  final ProfitRepo _repo;
  GetProfitWeeklyChartUseCase(this._repo);
  Future<ApiResult<ProfitWeeklyChart>> invoke(int storeId) =>
      _repo.getProfitWeeklyChart(storeId);
}
