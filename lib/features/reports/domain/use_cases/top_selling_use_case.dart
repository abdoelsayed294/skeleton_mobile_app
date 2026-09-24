import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/reports/domain/entities/top_selling_entity.dart';
import 'package:skeleton_mobile_app/features/reports/domain/repo/reports_repo.dart';

@injectable
class TopSellingUseCase {
  final ReportsRepo _reportsRepo;

  TopSellingUseCase(this._reportsRepo);

  Future<ApiResult<List<TopSellingEntity>>> getTopSelling(
    int storeId,
    String period,
    int take,
    int year,
    int month,
  ) {
    return _reportsRepo.getTopSelling(storeId, period, take, year, month);
  }
}
