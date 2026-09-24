import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/purchases/domain/entity/purchases_summary.dart';
import 'package:skeleton_mobile_app/features/purchases/domain/repo/purchases_repo.dart';

@injectable
class GetPurchasesSummaryUseCase {
  final PurchasesRepo _repo;

  GetPurchasesSummaryUseCase(this._repo);

  Future<ApiResult<PurchasesSummaryEntity>> invoke(
    int storeId,
    int year,
    int month,
  ) => _repo.getPurchasesSummary(storeId, year, month);
}
