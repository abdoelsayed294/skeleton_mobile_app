import 'package:injectable/injectable.dart';
import 'package:skeleton/core/networking/api_result.dart';
import 'package:skeleton/features/expeness/domain/entity/expenses_summary.dart';
import 'package:skeleton/features/expeness/domain/repository/expenses_repository.dart';

@injectable
class GetExpensesSummaryUseCase {
  GetExpensesSummaryUseCase(this._repository);
  final ExpensesRepository _repository;
  Future<ApiResult<ExpensesSummary>> invoke(
    int storeId,
    String period,
    String date,
  ) => _repository.getSummary(storeId, period, date);
}
