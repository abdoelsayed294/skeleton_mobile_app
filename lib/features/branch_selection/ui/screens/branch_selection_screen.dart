import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/features/branch_selection/logic/branches_cubit.dart';
import 'package:skeleton_mobile_app/features/branch_selection/logic/branch_selection_cubit.dart';
import 'package:skeleton_mobile_app/features/branch_selection/logic/branch_selection_state.dart';
import 'package:skeleton_mobile_app/features/branch_selection/ui/widgets/branch_selection_footer.dart';
import 'package:skeleton_mobile_app/features/branch_selection/ui/widgets/branch_selection_header.dart';
import 'package:skeleton_mobile_app/features/branch_selection/ui/widgets/branch_selection_listener.dart';
import 'package:skeleton_mobile_app/features/branch_selection/ui/widgets/branches_section.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class BranchSelectionScreen extends StatefulWidget {
  const BranchSelectionScreen({super.key});

  @override
  State<BranchSelectionScreen> createState() => _BranchSelectionScreenState();
}

class _BranchSelectionScreenState extends State<BranchSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;
    final secondary = isDark
        ? AppColorsDark.textSecondary
        : AppColorsLight.textSecondary;

    return BranchSelectionListener(
      child: BlocBuilder<BranchSelectionCubit, BranchSelectionState>(
        builder: (context, state) {
          final selectedBranch = state.maybeWhen(
            selected: (branch) => branch,
            saving: (branch) => branch,
            orElse: () => null,
          );
          final isSaving = state.maybeWhen(
            saving: (_) => true,
            orElse: () => false,
          );
          final isLoggingOut = state.maybeWhen(
            loggingOut: () => true,
            orElse: () => false,
          );

          return Scaffold(
            body: SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) => RefreshIndicator(
                  onRefresh: () => context.read<BranchesCubit>().getBranches(),
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: IntrinsicHeight(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(20.w, 26.h, 20.w, 22.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BranchSelectionHeader(
                                onLogout: context
                                    .read<BranchSelectionCubit>()
                                    .logout,
                                isLoggingOut: isLoggingOut,
                              ),
                              SizedBox(height: 30.h),
                              Text(
                                l10n.selectYourBranch,
                                style:
                                    (isDark
                                            ? AppStyles.font24BlackDark
                                            : AppStyles.font24BlackLight)
                                        .copyWith(
                                          fontSize: 29.sp,
                                          height: 1.16,
                                        ),
                              ),
                              SizedBox(height: 12.h),
                              Text(
                                l10n.chooseBranchToContinue,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  fontSize: 15.sp,
                                  color: secondary,
                                ),
                              ),
                              SizedBox(height: 34.h),
                              BranchesSection(
                                selectedBranchId: selectedBranch?.id,
                                onBranchSelected: context
                                    .read<BranchSelectionCubit>()
                                    .selectBranch,
                                onBranchesLoaded: (branches) {
                                  if (selectedBranch != null ||
                                      branches.isEmpty) {
                                    return;
                                  }
                                  WidgetsBinding.instance.addPostFrameCallback((
                                    _,
                                  ) {
                                    if (mounted && selectedBranch == null) {
                                      context
                                          .read<BranchSelectionCubit>()
                                          .selectDefaultBranch(branches);
                                    }
                                  });
                                },
                              ),
                              SizedBox(height: 32.h),
                              BranchSelectionFooter(
                                selectedBranch: selectedBranch,
                                isLoading: isSaving,
                                onContinue: context
                                    .read<BranchSelectionCubit>()
                                    .continueToDashboard,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
