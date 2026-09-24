import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/inventory/domain/entity/inventory_summary_response.dart';
import 'package:skeleton_mobile_app/features/inventory/domain/repo/inventory_summary_repo.dart';

@injectable
class InventorySummaryUseCase {
  final InventorySummaryRepo _inventorySummaryRepo;
  InventorySummaryUseCase(this._inventorySummaryRepo);
  Future<ApiResult<InventorySummaryResponse>> invoke(
    int storeId, {
    String? itemType,
  }) async {
    return _inventorySummaryRepo.getInventorySummary(
      storeId,
      itemType: itemType,
    );
  }
}
