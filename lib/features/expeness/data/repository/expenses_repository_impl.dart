import 'package:injectable/injectable.dart';
import 'package:skeleton/core/networking/api_result.dart';
import 'package:skeleton/features/expeness/data/data_source/remote/expenses_remote_data_source.dart';
import 'package:skeleton/features/expeness/data/mapper/expenses_mapper.dart';
import 'package:skeleton/features/expeness/domain/entity/expenses_by_category.dart';
import 'package:skeleton/features/expeness/domain/entity/expenses_monthly_trend.dart';
import 'package:skeleton/features/expeness/domain/entity/expenses_peak_days.dart';
import 'package:skeleton/features/expeness/domain/entity/expenses_summary.dart';
import 'package:skeleton/features/expeness/domain/entity/expenses_transactions.dart';
import 'package:skeleton/features/expeness/domain/repository/expenses_repository.dart';

@LazySingleton(as: ExpensesRepository)
class ExpensesRepositoryImpl implements ExpensesRepository {
  ExpensesRepositoryImpl(this._remote);
  final ExpensesRemoteDataSource _remote;

  @override
  Future<ApiResult<ExpensesSummary>> getSummary(
    int storeId,
    String period,
    String date,
  ) async {
    final result = await _remote.getSummary(storeId, period, date);
    return result.when(
      success: (data) => ApiResult.success(data.toEntity()),
      failure: ApiResult.failure,
    );
  }

  @override
  Future<ApiResult<ExpensesMonthlyTrend>> getMonthlyTrend(
    int storeId,
    String date,
  ) async {
    final result = await _remote.getMonthlyTrend(storeId, date);
    return result.when(
      success: (data) => ApiResult.success(data.toEntity()),
      failure: ApiResult.failure,
    );
  }

  @override
  Future<ApiResult<ExpensesByCategory>> getByCategory(
    int storeId,
    String period,
    String date,
  ) async {
    final result = await _remote.getByCategory(storeId, period, date);
    return result.when(
      success: (data) => ApiResult.success(data.toEntity()),
      failure: ApiResult.failure,
    );
  }

  @override
  Future<ApiResult<ExpensesPeakDays>> getPeakDays(int storeId, int take) async {
    final result = await _remote.getPeakDays(storeId, take);
    return result.when(
      success: (data) => ApiResult.success(data.toEntity()),
      failure: ApiResult.failure,
    );
  }

  @override
  Future<ApiResult<ExpensesTransactions>> getTransactions(
    int storeId,
    String sort,
    int take,
    String? date,
    String? period,
  ) async {
    final result = await _remote.getTransactions(
      storeId,
      sort,
      take,
      date,
      period,
    );
    return result.when(
      success: (data) => ApiResult.success(data.toEntity()),
      failure: ApiResult.failure,
    );
  }
}
