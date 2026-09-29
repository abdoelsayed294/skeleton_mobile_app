import 'package:injectable/injectable.dart';
import 'package:skeleton/core/networking/api_result.dart';
import 'package:skeleton/features/expeness/domain/entity/expenses_by_category.dart';
import 'package:skeleton/features/expeness/domain/repository/expenses_repository.dart';

@injectable
class GetExpensesByCategoryUseCase {
  GetExpensesByCategoryUseCase(this._repository);
  final ExpensesRepository _repository;
  Future<ApiResult<ExpensesByCategory>> invoke(
    int storeId,
    String period,
    String date,
  ) => _repository.getByCategory(storeId, period, date);
}
