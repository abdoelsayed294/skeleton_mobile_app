import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/purchases/domain/entity/purchases_recent.dart';
import 'package:skeleton_mobile_app/features/purchases/domain/entity/purchases_summary.dart';

abstract class PurchasesRepo {
  Future<ApiResult<PurchasesSummaryEntity>> getPurchasesSummary(
    int storeId,
    int year,
    int month,
  );

  Future<ApiResult<PurchasesRecentEntity>> getPurchasesRecent(
    int storeId,
    int year,
    int month,
    int take,
  );
}
