import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton/core/theming/app_color.dart';
import 'package:skeleton/core/widgets/dilaog_utils.dart';
import 'package:skeleton/features/branch_selection/domain/entity/branches_response.dart';
import 'package:skeleton/features/branch_selection/logic/branches_cubit.dart';
import 'package:skeleton/features/branch_selection/logic/branches_state.dart';
import 'package:skeleton/features/branch_selection/ui/widgets/branch_selection_card.dart';
import 'package:skeleton/features/branch_selection/ui/widgets/branch_selection_shimmer.dart';
import 'package:skeleton/features/branch_selection/ui/widgets/branches_empty_state.dart';
import 'package:skeleton/l10n/app_localizations.dart';

class BranchesSection extends StatelessWidget {
  final int? selectedBranchId;
  final ValueChanged<Branch> onBranchSelected;
  final ValueChanged<List<Branch>> onBranchesLoaded;

  const BranchesSection({
    super.key,
    required this.selectedBranchId,
    required this.onBranchSelected,
    required this.onBranchesLoaded,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final secondary = isDark
        ? AppColorsDark.textSecondary
        : AppColorsLight.textSecondary;
    final primary = isDark ? AppColorsDark.primary : AppColorsLight.primary;

    return BlocConsumer<BranchesCubit, BranchesState>(
      listener: (context, state) {
        state.whenOrNull(
          error: (error) => DialogUtils.showMessage(
            context: context,
            type: DialogType.error,
            title: l10n.errorTitle,
            message: error.error?.message ?? l10n.genericError,
          ),
        );
      },
      builder: (context, state) {
        final branches = state.maybeWhen(
          success: (data) => data.branches?.whereType<Branch>().toList() ?? [],
          orElse: () => const <Branch>[],
        );
        if (state is Success) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            onBranchesLoaded(branches);
          });
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    l10n.availableBranches.toUpperCase(),
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.1,
                      color: secondary,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: primary.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: state.maybeWhen(
                    success: (_) => Text(
                      l10n.branchCount(branches.length),
                      style: TextStyle(
                        color: primary,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    orElse: () => SizedBox(width: 35.w, height: 11.h),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Divider(height: 1, color: Theme.of(context).dividerColor),
            SizedBox(height: 24.h),
            state.when(
              initial: () => const SizedBox.shrink(),
              loading: () => const BranchSelectionShimmer(),
              error: (_) => Center(
                child: Text(
                  l10n.genericError,
                  style: TextStyle(color: secondary, fontSize: 12.sp),
                ),
              ),
              success: (_) {
                if (branches.isEmpty) return const BranchesEmptyState();
                return Column(
                  children: branches
                      .map(
                        (branch) => Padding(
                          padding: EdgeInsets.only(bottom: 10.h),
                          child: BranchSelectionCard(
                            branch: branch,
                            isSelected: branch.id == selectedBranchId,
                            onTap: () => onBranchSelected(branch),
                          ),
                        ),
                      )
                      .toList(),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
