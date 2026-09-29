import 'package:injectable/injectable.dart';
import 'package:skeleton/core/networking/api_result.dart';
import 'package:skeleton/features/purchases/data/data_sources/remote/purchases_remote_data_source.dart';
import 'package:skeleton/features/purchases/data/mappers/purchases_mapper.dart';
import 'package:skeleton/features/purchases/domain/entity/purchases_recent.dart';
import 'package:skeleton/features/purchases/domain/entity/purchases_summary.dart';
import 'package:skeleton/features/purchases/domain/repo/purchases_repo.dart';

@Injectable(as: PurchasesRepo)
class PurchasesRepoImpl implements PurchasesRepo {
  final PurchasesRemoteDataSource _remote;

  PurchasesRepoImpl(this._remote);

  @override
  Future<ApiResult<PurchasesSummaryEntity>> getPurchasesSummary(
    int storeId,
    String date,
  ) async {
    final result = await _remote.getPurchasesSummary(storeId, date);
    return result.when(
      success: (data) => ApiResult.success(data.toEntity()),
      failure: (error) => ApiResult.failure(error),
    );
  }

  @override
  Future<ApiResult<PurchasesRecentEntity>> getPurchasesRecent(
    int storeId,
    String date,
    int take,
  ) async {
    final result = await _remote.getPurchasesRecent(storeId, date, take);
    return result.when(
      success: (data) => ApiResult.success(data.toEntity()),
      failure: (error) => ApiResult.failure(error),
    );
  }
}
