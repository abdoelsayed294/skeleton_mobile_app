import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/purchases/data/data_sources/remote/purchases_remote_data_source.dart';
import 'package:skeleton_mobile_app/features/purchases/data/mappers/purchases_mapper.dart';
import 'package:skeleton_mobile_app/features/purchases/domain/entity/purchases_recent.dart';
import 'package:skeleton_mobile_app/features/purchases/domain/entity/purchases_summary.dart';
import 'package:skeleton_mobile_app/features/purchases/domain/repo/purchases_repo.dart';

@Injectable(as: PurchasesRepo)
class PurchasesRepoImpl implements PurchasesRepo {
  final PurchasesRemoteDataSource _remote;

  PurchasesRepoImpl(this._remote);

  @override
  Future<ApiResult<PurchasesSummaryEntity>> getPurchasesSummary(
    int storeId,
    int year,
    int month,
  ) async {
    final result = await _remote.getPurchasesSummary(storeId, year, month);
    return result.when(
      success: (data) => ApiResult.success(data.toEntity()),
      failure: (error) => ApiResult.failure(error),
    );
  }

  @override
  Future<ApiResult<PurchasesRecentEntity>> getPurchasesRecent(
    int storeId,
    int year,
    int month,
    int take,
  ) async {
    final result = await _remote.getPurchasesRecent(storeId, year, month, take);
    return result.when(
      success: (data) => ApiResult.success(data.toEntity()),
      failure: (error) => ApiResult.failure(error),
    );
  }
}
