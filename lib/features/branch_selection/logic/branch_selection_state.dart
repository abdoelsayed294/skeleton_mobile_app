import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skeleton/core/networking/api_error_model.dart';
import 'package:skeleton/features/branch_selection/domain/entity/branches_response.dart';

part 'branch_selection_state.freezed.dart';

@freezed
abstract class BranchSelectionState with _$BranchSelectionState {
  const factory BranchSelectionState.initial() = _Initial;
  const factory BranchSelectionState.selected(Branch branch) = Selected;
  const factory BranchSelectionState.saving(Branch branch) = Saving;
  const factory BranchSelectionState.completed() = Completed;
  const factory BranchSelectionState.loggingOut() = LoggingOut;
  const factory BranchSelectionState.loggedOut() = LoggedOut;
  const factory BranchSelectionState.error(ApiErrorModel error) = Error;
}
