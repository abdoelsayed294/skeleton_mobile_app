import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/profit_details/data/data_sources/remote/profit_remote_data_source.dart';
import 'package:skeleton_mobile_app/features/profit_details/data/mappers/profit_mapper.dart';
import 'package:skeleton_mobile_app/features/profit_details/domain/entity/profit_summary.dart';
import 'package:skeleton_mobile_app/features/profit_details/domain/entity/profit_weekly_chart.dart';
import 'package:skeleton_mobile_app/features/profit_details/domain/repo/profit_repo.dart';

@Injectable(as: ProfitRepo)
class ProfitRepoImpl implements ProfitRepo {
  final ProfitRemoteDataSource _remote;
  ProfitRepoImpl(this._remote);
  @override
  Future<ApiResult<ProfitSummary>> getProfitSummary(
    String period,
    int storeId, {
    String? from,
    String? to,
  }) async {
    final result = await _remote.getProfitSummary(
      period,
      storeId,
      from: from,
      to: to,
    );
    return result.when(
      success: (data) => ApiResult.success(data.toEntity()),
      failure: (error) => ApiResult.failure(error),
    );
  }

  @override
  Future<ApiResult<ProfitWeeklyChart>> getProfitWeeklyChart(int storeId) async {
    final result = await _remote.getProfitWeeklyChart(storeId);
    return result.when(
      success: (data) => ApiResult.success(data.toEntity()),
      failure: (error) => ApiResult.failure(error),
    );
  }
}
