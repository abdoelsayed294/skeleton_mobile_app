import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/helpers/shared_pref_helper.dart';
import 'package:skeleton_mobile_app/core/networking/api_error_handler.dart';
import 'package:skeleton_mobile_app/features/branch_selection/domain/entity/branches_response.dart';
import 'package:skeleton_mobile_app/features/branch_selection/domain/use_cases/save_selected_branch_use_case.dart';
import 'package:skeleton_mobile_app/features/branch_selection/logic/branch_selection_state.dart';

@injectable
class BranchSelectionCubit extends Cubit<BranchSelectionState> {
  final SaveSelectedBranchUseCase _saveSelectedBranchUseCase;
  Branch? _selectedBranch;
  bool _restoringSelection = false;

  BranchSelectionCubit(this._saveSelectedBranchUseCase)
    : super(BranchSelectionState.initial());

  void selectBranch(Branch branch) {
    _selectedBranch = branch;
    emit(BranchSelectionState.selected(branch));
  }

  Future<void> selectDefaultBranch(List<Branch> branches) async {
    if (_selectedBranch != null || _restoringSelection || branches.isEmpty) {
      return;
    }
    _restoringSelection = true;
    try {
      final savedStoreId = await SharedPrefHelper.getInt(
        SharedPrefHelper.storeIdKey,
      );
      if (_selectedBranch != null) return;
      Branch? branch;
      for (final item in branches) {
        if (item.id == savedStoreId) {
          branch = item;
          break;
        }
      }
      branch ??= branches.firstWhere(
        (item) => item.isActive == true,
        orElse: () => branches.first,
      );
      _selectedBranch = branch;
      emit(BranchSelectionState.selected(branch));
    } finally {
      _restoringSelection = false;
    }
  }

  Future<void> continueToDashboard() async {
    final branch = _selectedBranch;
    if (branch?.id == null) return;

    emit(BranchSelectionState.saving(branch!));
    try {
      await _saveSelectedBranchUseCase.invoke(
        branch.id!,
        businessName: branch.business?.name,
      );
      emit(const BranchSelectionState.completed());
    } catch (error) {
      emit(BranchSelectionState.error(ApiErrorHandler.handle(error)));
    }
  }

  Future<void> logout() async {
    emit(const BranchSelectionState.loggingOut());
    try {
      await SharedPrefHelper.removeData(SharedPrefHelper.qrStatusKey);
      await SharedPrefHelper.removeData(SharedPrefHelper.businessIdKey);
      await SharedPrefHelper.removeData(SharedPrefHelper.businessNameKey);
      await SharedPrefHelper.removeData(SharedPrefHelper.storeIdKey);
      _selectedBranch = null;
      emit(const BranchSelectionState.loggedOut());
    } catch (error) {
      emit(BranchSelectionState.error(ApiErrorHandler.handle(error)));
    }
  }
}
