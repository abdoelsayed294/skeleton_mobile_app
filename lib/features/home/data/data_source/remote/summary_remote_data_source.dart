import 'package:skeleton/core/networking/api_result.dart';
import 'package:skeleton/features/home/data/models/summary_response_dto.dart';

abstract class SummaryRemoteDataSource {
  Future<ApiResult<SummaryResponseDto>> getSummary(int storeId, String date);
}
