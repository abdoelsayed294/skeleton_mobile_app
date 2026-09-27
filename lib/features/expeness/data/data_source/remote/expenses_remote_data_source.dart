import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/expeness/data/model/expenses_by_category_dto.dart';
import 'package:skeleton_mobile_app/features/expeness/data/model/expenses_monthly_trend_dto.dart';
import 'package:skeleton_mobile_app/features/expeness/data/model/expenses_peak_days_dto.dart';
import 'package:skeleton_mobile_app/features/expeness/data/model/expenses_summary_dto.dart';
import 'package:skeleton_mobile_app/features/expeness/data/model/expenses_transactions_dto.dart';

abstract class ExpensesRemoteDataSource {
  Future<ApiResult<ExpensesSummaryDto>> getSummary(
    int storeId,
    String period,
    String date,
  );
  Future<ApiResult<ExpensesMonthlyTrendDto>> getMonthlyTrend(
    int storeId,
    String date,
  );
  Future<ApiResult<ExpensesByCategoryDto>> getByCategory(
    int storeId,
    String period,
    String date,
  );
  Future<ApiResult<ExpensesPeakDaysDto>> getPeakDays(int storeId, int take);
  Future<ApiResult<ExpensesTransactionsDto>> getTransactions(
    int storeId,
    String sort,
    int take,
    int skip,
  );
}
