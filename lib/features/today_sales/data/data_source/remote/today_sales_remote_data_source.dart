import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/today_sales/data/models/today_recent_transaction_dto.dart';
import 'package:skeleton_mobile_app/features/today_sales/data/models/today_sales_dto.dart';

abstract class TodaySalesRemoteDataSource {
  Future<ApiResult<TodaySalesDto>> getTodaySales(int storeId, DateTime date);

  Future<ApiResult<List<TodayRecentTransactionDto>>> getRecentTransactions(
    int storeId,
    DateTime date,
    int take,
    bool all,
  );
}
