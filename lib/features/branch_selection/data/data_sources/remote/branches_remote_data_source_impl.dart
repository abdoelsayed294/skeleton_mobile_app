import 'package:injectable/injectable.dart';
import 'package:skeleton/core/networking/api_error_handler.dart';
import 'package:skeleton/core/networking/api_result.dart';
import 'package:skeleton/core/networking/api_service.dart';
import 'package:skeleton/features/branch_selection/data/data_sources/remote/branches_remote_data_source.dart';
import 'package:skeleton/features/branch_selection/data/model/branches_response_dto.dart';

@Injectable(as: BranchesRemoteDataSource)
class BranchesRemoteDataSourceImpl implements BranchesRemoteDataSource {
  final ApiService _apiService;

  BranchesRemoteDataSourceImpl(this._apiService);

  @override
  Future<ApiResult<BranchesResponseDto>> getBranches(int businessId) async {
    try {
      final response = await _apiService.getBranches(businessId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
