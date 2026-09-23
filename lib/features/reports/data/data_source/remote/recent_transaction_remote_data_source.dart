import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/reports/data/models/recent_transaction_dto.dart';

abstract class RecentTransactionRemoteDataSource {
  Future<ApiResult<List<RecentTransactionDto>>> getRecentTransactions(int storeId, String period, int take);
}
