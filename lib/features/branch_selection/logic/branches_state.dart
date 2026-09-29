import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skeleton/core/networking/api_error_model.dart';
import 'package:skeleton/features/branch_selection/domain/entity/branches_response.dart';

part 'branches_state.freezed.dart';

@freezed
abstract class BranchesState with _$BranchesState {
  const factory BranchesState.initial() = _Initial;
  const factory BranchesState.loading() = Loading;
  const factory BranchesState.success(BranchesResponse data) = Success;
  const factory BranchesState.error(ApiErrorModel apiErrorModel) = Error;
}
