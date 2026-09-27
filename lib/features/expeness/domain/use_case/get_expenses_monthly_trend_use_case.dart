import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/expeness/domain/entity/expenses_monthly_trend.dart';
import 'package:skeleton_mobile_app/features/expeness/domain/repository/expenses_repository.dart';

@injectable
class GetExpensesMonthlyTrendUseCase {
  GetExpensesMonthlyTrendUseCase(this._repository);
  final ExpensesRepository _repository;
  Future<ApiResult<ExpensesMonthlyTrend>> invoke(int storeId, String date) =>
      _repository.getMonthlyTrend(storeId, date);
}
