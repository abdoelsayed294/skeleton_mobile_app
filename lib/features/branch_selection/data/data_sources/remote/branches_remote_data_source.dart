import 'package:skeleton/core/networking/api_result.dart';
import 'package:skeleton/features/branch_selection/data/model/branches_response_dto.dart';

abstract class BranchesRemoteDataSource {
  Future<ApiResult<BranchesResponseDto>> getBranches(int businessId);
}
