import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/today_sales/domain/entities/today_recent_transaction_entity.dart';
import 'package:skeleton_mobile_app/features/today_sales/domain/repo/today_sales_repo.dart';

@injectable
class GetTodayRecentTransactionUseCase {
  final TodaySalesRepo _todaySalesRepo;

  GetTodayRecentTransactionUseCase(this._todaySalesRepo);

  Future<ApiResult<List<TodayRecentTransactionEntity>>> getRecentTransactions(
    int storeId,
    DateTime date,
    int take,
    bool all,
  ) {
    return _todaySalesRepo.getRecentTransactions(storeId, date, take, all);
  }
}
