import 'package:flutter/material.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/features/reports/ui/widgets/reports_appbar_icon_button.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';


class ReportsAppBar extends StatelessWidget {
  final VoidCallback? onSyncTap;
  final VoidCallback? onProfileTap;

  const ReportsAppBar({super.key, this.onSyncTap, this.onProfileTap});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;

    return Row(
      children: [
        ReportsAppBarIconButton(
          icon: Icons.swap_horiz_rounded,
          onTap: onSyncTap,
        ),
        Expanded(
          child: Text(
            l10n.salesReportsTitle,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: isDark
                ? AppStyles.reportsHeaderTitleDark
                : AppStyles.reportsHeaderTitleLight,
          ),
        ),
      
      ],
    );
  }
}

