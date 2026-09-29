import 'package:injectable/injectable.dart';
import 'package:skeleton/core/networking/api_result.dart';
import 'package:skeleton/features/branch_selection/domain/entity/branches_response.dart';
import 'package:skeleton/features/branch_selection/domain/repo/branches_repo.dart';

@injectable
class GetBranchesUseCase {
  final BranchesRepo _branchesRepo;

  GetBranchesUseCase(this._branchesRepo);

  Future<ApiResult<BranchesResponse>> invoke(int businessId) =>
      _branchesRepo.getBranches(businessId);
}
