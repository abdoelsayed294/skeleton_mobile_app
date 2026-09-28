import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/purchases/data/model/purchases_dto.dart';

abstract class PurchasesRemoteDataSource {
  Future<ApiResult<PurchasesSummaryDto>> getPurchasesSummary(
    int storeId,
    String date,
  );

  Future<ApiResult<PurchasesRecentDto>> getPurchasesRecent(
    int storeId,
    String date,
    int take,
  );
}
