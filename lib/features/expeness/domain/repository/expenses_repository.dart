import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/expeness/domain/entity/expenses_by_category.dart';
import 'package:skeleton_mobile_app/features/expeness/domain/entity/expenses_monthly_trend.dart';
import 'package:skeleton_mobile_app/features/expeness/domain/entity/expenses_peak_days.dart';
import 'package:skeleton_mobile_app/features/expeness/domain/entity/expenses_summary.dart';
import 'package:skeleton_mobile_app/features/expeness/domain/entity/expenses_transactions.dart';

abstract class ExpensesRepository {
  Future<ApiResult<ExpensesSummary>> getSummary(
    int storeId,
    String period,
    String date,
  );
  Future<ApiResult<ExpensesMonthlyTrend>> getMonthlyTrend(
    int storeId,
    String date,
  );
  Future<ApiResult<ExpensesByCategory>> getByCategory(
    int storeId,
    String period,
    String date,
  );
  Future<ApiResult<ExpensesPeakDays>> getPeakDays(int storeId, int take);
  Future<ApiResult<ExpensesTransactions>> getTransactions(
    int storeId,
    String sort,
    int take,
    String date,
  );
}
