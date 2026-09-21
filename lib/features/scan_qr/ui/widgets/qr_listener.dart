import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeleton_mobile_app/core/widgets/dilaog_utils.dart';
import 'package:skeleton_mobile_app/features/scan_qr/domain/entity/qr_response.dart';
import 'package:skeleton_mobile_app/features/scan_qr/logic/qr_cubit.dart';
import 'package:skeleton_mobile_app/features/scan_qr/logic/qr_state.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class QrBlocListener extends StatelessWidget {
final ValueChanged<QrResponse> onSuccess;
  const QrBlocListener({super.key, required this.onSuccess});

  @override
  Widget build(BuildContext context) {
    return BlocListener<QrCubit, QrState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            DialogUtils.showLoading(context: context);
          },
          success: (qrResponse) {
            DialogUtils.hideLoading(context);
            onSuccess(qrResponse);
          },
          error: (apiErrorModel) {
            DialogUtils.hideLoading(context);
            final l10n = AppLocalizations.of(context)!;

            DialogUtils.showMessage(
              context: context,
              type: DialogType.error,
              title: l10n.errorTitle,
              message: apiErrorModel.error?.message ?? l10n.genericError,
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
