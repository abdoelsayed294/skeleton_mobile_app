import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/branch_selection/domain/entity/branches_response.dart';

abstract class BranchesRepo {
  Future<ApiResult<BranchesResponse>> getBranches(int businessId);
}
