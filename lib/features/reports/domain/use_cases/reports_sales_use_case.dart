import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/reports/domain/entities/reports_sales_entity.dart';
import 'package:skeleton_mobile_app/features/reports/domain/repo/reports_repo.dart';

@injectable
class ReportsSalesUseCase {
  final ReportsRepo _reportsRepo;

  ReportsSalesUseCase(this._reportsRepo);

  Future<ApiResult<ReportsSalesEntity>> getReportsSales(String period, int storeId) {
    return _reportsRepo.getReportsSales(period, storeId);
  }
}
