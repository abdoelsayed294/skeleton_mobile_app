import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/today_sales/domain/entities/today_recent_transaction_entity.dart';
import 'package:skeleton_mobile_app/features/today_sales/domain/entities/today_sales_entity.dart';

abstract class TodaySalesRepo {
  Future<ApiResult<TodaySalesEntity>> getTodaySales(int storeId);
  Future<ApiResult<List<TodayRecentTransactionEntity>>> getRecentTransactions(int storeId, String period, int take);
}
