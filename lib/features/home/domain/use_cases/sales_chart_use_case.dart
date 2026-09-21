import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/home/domain/entities/sales_chart_entity.dart';
import 'package:skeleton_mobile_app/features/home/domain/repo/home_repo.dart';

class SalesChartUseCase {
  final HomeRepo _homeRepo;

  SalesChartUseCase(this._homeRepo);

  Future<ApiResult<List<SalesChartEntity>>> getSalesChart(int storeId, String period, int days) {
    return _homeRepo.getSalesChart(storeId, period, days);
  }
}