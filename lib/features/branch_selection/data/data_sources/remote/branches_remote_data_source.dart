import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/branch_selection/data/model/branches_response_dto.dart';

abstract class BranchesRemoteDataSource {
  Future<ApiResult<BranchesResponseDto>> getBranches(int businessId);
}
