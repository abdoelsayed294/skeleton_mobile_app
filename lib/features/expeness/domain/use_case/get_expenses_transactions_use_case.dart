import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/expeness/domain/entity/expenses_transactions.dart';
import 'package:skeleton_mobile_app/features/expeness/domain/repository/expenses_repository.dart';

@injectable
class GetExpensesTransactionsUseCase {
  GetExpensesTransactionsUseCase(this._repository);
  final ExpensesRepository _repository;
  Future<ApiResult<ExpensesTransactions>> invoke(
    int storeId, {
    String sort = 'latest',
    int take = 50,
    required String date,
  }) => _repository.getTransactions(storeId, sort, take, date);
}
