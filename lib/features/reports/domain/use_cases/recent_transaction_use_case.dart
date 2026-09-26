import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/reports/domain/entities/recent_transaction_entity.dart';
import 'package:skeleton_mobile_app/features/reports/domain/repo/reports_repo.dart';

@injectable
class RecentTransactionUseCase {
  final ReportsRepo _reportsRepo;

  RecentTransactionUseCase(this._reportsRepo);

  Future<ApiResult<List<RecentTransactionEntity>>> getRecentTransactions(
    int storeId,
    int take,
    int year,
    int month,
  ) {
    return _reportsRepo.getRecentTransactions(storeId, take, year, month);
  }
}
