import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/profit_details/domain/entity/profit_summary.dart';
import 'package:skeleton_mobile_app/features/profit_details/domain/repo/profit_repo.dart';

@injectable
class GetProfitSummaryUseCase {
  final ProfitRepo _repo;
  GetProfitSummaryUseCase(this._repo);
  Future<ApiResult<ProfitSummary>> invoke(
    String period,
    int storeId, {
    String? from,
    String? to,
  }) => _repo.getProfitSummary(period, storeId, from: from, to: to);
}
