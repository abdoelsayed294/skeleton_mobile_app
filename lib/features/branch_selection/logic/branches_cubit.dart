import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/helpers/shared_pref_helper.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/branch_selection/domain/use_cases/get_branches_use_case.dart';
import 'package:skeleton_mobile_app/features/branch_selection/logic/branches_state.dart';

@injectable
class BranchesCubit extends Cubit<BranchesState> {
  final GetBranchesUseCase _getBranchesUseCase;

  BranchesCubit(this._getBranchesUseCase) : super(BranchesState.initial());

  Future<void> getBranches() async {
    emit(BranchesState.loading());
    final businessId = await SharedPrefHelper.getInt(
      SharedPrefHelper.businessIdKey,
    );
    final result = await _getBranchesUseCase.invoke(businessId);
    result.when(
      success: (data) => emit(BranchesState.success(data)),
      failure: (error) => emit(BranchesState.error(error)),
    );
  }
}
