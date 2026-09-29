import 'package:injectable/injectable.dart';
import 'package:skeleton/core/networking/api_result.dart';
import 'package:skeleton/features/home/domain/entities/summary_response.dart';
import 'package:skeleton/features/home/domain/repo/home_repo.dart';

@injectable
class SummaryUseCase {
  final HomeRepo _homeRepo;

  SummaryUseCase(this._homeRepo);

  Future<ApiResult<SummaryResponse>> getSummary(int storeId, String date) {
    return _homeRepo.getSummary(storeId, date);
  }
}
