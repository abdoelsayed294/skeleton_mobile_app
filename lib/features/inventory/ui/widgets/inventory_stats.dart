import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/features/inventory/ui/widgets/inventory_stat_card.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class InventoryStats extends StatelessWidget {
  final AppLocalizations l10n;

  const InventoryStats({super.key, required this.l10n});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primary = isDark ? AppColorsDark.primary : AppColorsLight.primary;
    final warning = isDark
        ? AppColorsDark.warningAlt
        : AppColorsLight.warningAlt;
    final error = isDark ? AppColorsDark.errorAlt : AppColorsLight.errorAlt;
    return Row(
      children: [
        Expanded(
          child: InventoryStatCard(
            value: '48',
            label: l10n.totalProducts,
            icon: Icons.inventory_2_outlined,
            color: primary,
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: InventoryStatCard(
            value: '7',
            label: l10n.lowStock,
            icon: Icons.warning_amber_rounded,
            color: warning,
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: InventoryStatCard(
            value: '3',
            label: l10n.outOfStock,
            icon: Icons.block_outlined,
            color: error,
          ),
        ),
      ],
    );
  }
}
