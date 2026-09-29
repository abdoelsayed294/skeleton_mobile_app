import 'package:skeleton/core/networking/api_result.dart';
import 'package:skeleton/features/reports/data/models/recent_transaction_dto.dart';

abstract class RecentTransactionRemoteDataSource {
  Future<ApiResult<List<RecentTransactionDto>>> getRecentTransactions(
    int storeId,
    int take,
    int year,
    int month,
  );
}
