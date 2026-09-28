import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/branch_selection/data/data_sources/remote/branches_remote_data_source.dart';
import 'package:skeleton_mobile_app/features/branch_selection/data/mappers/branches_mapper.dart';
import 'package:skeleton_mobile_app/features/branch_selection/domain/entity/branches_response.dart';
import 'package:skeleton_mobile_app/features/branch_selection/domain/repo/branches_repo.dart';

@Injectable(as: BranchesRepo)
class BranchesRepoImpl implements BranchesRepo {
  final BranchesRemoteDataSource _remoteDataSource;

  BranchesRepoImpl(this._remoteDataSource);

  @override
  Future<ApiResult<BranchesResponse>> getBranches(int businessId) async {
    final result = await _remoteDataSource.getBranches(businessId);
    return result.when(
      success: (data) => ApiResult.success(data.toEntity()),
      failure: (error) => ApiResult.failure(error),
    );
  }
}
