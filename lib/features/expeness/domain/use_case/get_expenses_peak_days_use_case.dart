import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/expeness/domain/entity/expenses_peak_days.dart';
import 'package:skeleton_mobile_app/features/expeness/domain/repository/expenses_repository.dart';

@injectable
class GetExpensesPeakDaysUseCase {
  GetExpensesPeakDaysUseCase(this._repository);
  final ExpensesRepository _repository;
  Future<ApiResult<ExpensesPeakDays>> invoke(int storeId, {int take = 5}) =>
      _repository.getPeakDays(storeId, take);
}
