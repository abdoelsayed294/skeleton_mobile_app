import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/networking/api_error_handler.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/core/networking/api_service.dart';
import 'package:skeleton_mobile_app/features/expeness/data/data_source/remote/expenses_remote_data_source.dart';
import 'package:skeleton_mobile_app/features/expeness/data/model/expenses_by_category_dto.dart';
import 'package:skeleton_mobile_app/features/expeness/data/model/expenses_monthly_trend_dto.dart';
import 'package:skeleton_mobile_app/features/expeness/data/model/expenses_peak_days_dto.dart';
import 'package:skeleton_mobile_app/features/expeness/data/model/expenses_summary_dto.dart';
import 'package:skeleton_mobile_app/features/expeness/data/model/expenses_transactions_dto.dart';

@Injectable(as: ExpensesRemoteDataSource)
class ExpensesRemoteDataSourceImpl implements ExpensesRemoteDataSource {
  ExpensesRemoteDataSourceImpl(this._api);
  final ApiService _api;

  @override
  Future<ApiResult<ExpensesSummaryDto>> getSummary(
    int storeId,
    String period,
    String date,
  ) async {
    try {
      return ApiResult.success(
        await _api.getExpensesSummary(storeId, period, date),
      );
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResult<ExpensesMonthlyTrendDto>> getMonthlyTrend(
    int storeId,
    String date,
  ) async {
    try {
      return ApiResult.success(
        await _api.getExpensesMonthlyTrend(storeId, date),
      );
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResult<ExpensesByCategoryDto>> getByCategory(
    int storeId,
    String period,
    String date,
  ) async {
    try {
      return ApiResult.success(
        await _api.getExpensesByCategory(storeId, period, date),
      );
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResult<ExpensesPeakDaysDto>> getPeakDays(
    int storeId,
    int take,
  ) async {
    try {
      return ApiResult.success(await _api.getExpensesPeakDays(storeId, take));
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResult<ExpensesTransactionsDto>> getTransactions(
    int storeId,
    String sort,
    int take,
    String date,
  ) async {
    try {
      return ApiResult.success(
        await _api.getExpensesTransactions(storeId, sort, take, date),
      );
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
