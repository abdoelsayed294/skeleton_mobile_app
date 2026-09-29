import 'package:skeleton/core/networking/api_result.dart';
import 'package:skeleton/features/purchases/data/model/purchases_dto.dart';

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
