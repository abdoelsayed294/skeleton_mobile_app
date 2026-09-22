import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/widgets/dilaog_utils.dart';
import 'package:skeleton_mobile_app/features/inventory/logic/inventory_cubit.dart';
import 'package:skeleton_mobile_app/features/inventory/logic/inventory_state.dart';
import 'package:skeleton_mobile_app/features/inventory/ui/widgets/invemtory_state_shimmer.dart';
import 'package:skeleton_mobile_app/features/inventory/ui/widgets/inventory_stat_card.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class InventoryStats extends StatelessWidget {
  final AppLocalizations l10n;

  const InventoryStats({
    super.key,
    required this.l10n,
  });

  @override
  Widget build(BuildContext context) {
    final isDark =
        Theme.of(context).brightness == Brightness.dark;

    final primary =
        isDark ? AppColorsDark.primary : AppColorsLight.primary;

    final warning =
        isDark ? AppColorsDark.warningAlt : AppColorsLight.warningAlt;

    final error =
        isDark ? AppColorsDark.errorAlt : AppColorsLight.errorAlt;

    return BlocConsumer<InventoryCubit, InventoryState>(
      listener: (context, state) { state.maybeWhen( error: (error) { DialogUtils.showMessage( context: context, type: DialogType.error, title: l10n.errorTitle, message: error.error?.message ?? l10n.genericError, ); }, orElse: () {}, ); },
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => const SizedBox.shrink(),

loading: () => const InventoryStatsShimmer(),

          success: (data) {
            return Row(
              children: [
                Expanded(
                  child: InventoryStatCard(
                    value: (data.totalProducts ?? 0).toString(),
                    label: l10n.totalProducts,
                    icon: Icons.inventory_2_outlined,
                    color: primary,
                  ),
                ),

                SizedBox(width: 10.w),

                Expanded(
                  child: InventoryStatCard(
                    value: (data.lowStock ?? 0).toString(),
                    label: l10n.lowStock,
                    icon: Icons.warning_amber_rounded,
                    color: warning,
                  ),
                ),

                SizedBox(width: 10.w),

                Expanded(
                  child: InventoryStatCard(
                    value: (data.outOfStock ?? 0).toString(),
                    label: l10n.outOfStock,
                    icon: Icons.block_outlined,
                    color: error,
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
