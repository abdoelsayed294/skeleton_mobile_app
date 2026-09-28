import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeleton_mobile_app/core/routing/routes.dart';
import 'package:skeleton_mobile_app/core/widgets/dilaog_utils.dart';
import 'package:skeleton_mobile_app/features/branch_selection/logic/branch_selection_cubit.dart';
import 'package:skeleton_mobile_app/features/branch_selection/logic/branch_selection_state.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class BranchSelectionListener extends StatelessWidget {
  final Widget child;

  const BranchSelectionListener({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<BranchSelectionCubit, BranchSelectionState>(
      listenWhen: (previous, current) =>
          current is Completed || current is LoggedOut || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          completed: () => Navigator.of(
            context,
          ).pushNamedAndRemoveUntil(Routes.mainScreen, (route) => false),
          loggedOut: () => Navigator.of(
            context,
          ).pushNamedAndRemoveUntil(Routes.scanQrScreen, (route) => false),
          error: (error) {
            final l10n = AppLocalizations.of(context)!;
            DialogUtils.showMessage(
              context: context,
              type: DialogType.error,
              title: l10n.errorTitle,
              message: error.error?.message ?? l10n.genericError,
            );
          },
        );
      },
      child: child,
    );
  }
}
