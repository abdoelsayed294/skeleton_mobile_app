import 'package:skeleton/core/networking/api_result.dart';
import 'package:skeleton/features/branch_selection/domain/entity/branches_response.dart';

abstract class BranchesRepo {
  Future<ApiResult<BranchesResponse>> getBranches(int businessId);
}
