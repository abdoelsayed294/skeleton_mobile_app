import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/networking/api_error_handler.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/core/networking/api_service.dart';
import 'package:skeleton_mobile_app/features/home/data/data_source/remote/summary_remote_data_source.dart';
import 'package:skeleton_mobile_app/features/home/data/models/summary_response_dto.dart';

@Injectable(as: SummaryRemoteDataSource)
class SummaryRemoteDataSourceImpl extends SummaryRemoteDataSource {
  final ApiService apiService;
  SummaryRemoteDataSourceImpl(this.apiService);
  @override
  Future<ApiResult<SummaryResponseDto>> getSummary(
    int storeId,
    String date,
  ) async {
    try {
      final response = await apiService.getSummary(storeId, date);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
