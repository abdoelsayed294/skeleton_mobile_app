import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/purchases/data/model/purchases_dto.dart';

abstract class PurchasesRemoteDataSource {
  Future<ApiResult<PurchasesSummaryDto>> getPurchasesSummary(
    int storeId,
    int year,
    int month,
  );

  Future<ApiResult<PurchasesRecentDto>> getPurchasesRecent(
    int storeId,
    int year,
    int month,
    int take,
  );
}
