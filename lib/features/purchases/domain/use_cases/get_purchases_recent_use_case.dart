import 'package:injectable/injectable.dart';
import 'package:skeleton/core/networking/api_result.dart';
import 'package:skeleton/features/purchases/domain/entity/purchases_recent.dart';
import 'package:skeleton/features/purchases/domain/repo/purchases_repo.dart';

@injectable
class GetPurchasesRecentUseCase {
  final PurchasesRepo _repo;

  GetPurchasesRecentUseCase(this._repo);

  Future<ApiResult<PurchasesRecentEntity>> invoke(
    int storeId,
    String date,
    int take,
  ) => _repo.getPurchasesRecent(storeId, date, take);
}
