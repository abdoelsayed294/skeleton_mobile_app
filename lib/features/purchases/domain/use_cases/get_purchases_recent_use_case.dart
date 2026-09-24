import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/purchases/domain/entity/purchases_recent.dart';
import 'package:skeleton_mobile_app/features/purchases/domain/repo/purchases_repo.dart';

@injectable
class GetPurchasesRecentUseCase {
  final PurchasesRepo _repo;

  GetPurchasesRecentUseCase(this._repo);

  Future<ApiResult<PurchasesRecentEntity>> invoke(
    int storeId,
    int year,
    int month,
    int take,
  ) => _repo.getPurchasesRecent(storeId, year, month, take);
}
