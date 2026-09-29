import 'package:injectable/injectable.dart';
import 'package:skeleton/core/networking/api_result.dart';
import 'package:skeleton/features/home/domain/entities/sales_chart_response.dart';
import 'package:skeleton/features/home/domain/repo/home_repo.dart';

@injectable
class SalesChartUseCase {
  final HomeRepo _homeRepo;

  SalesChartUseCase(this._homeRepo);

  Future<ApiResult<SalesChartResponse>> getSalesChart(
    int storeId,
    String period,
    int days,
  ) {
    return _homeRepo.getSalesChart(storeId, period, days);
  }
}
