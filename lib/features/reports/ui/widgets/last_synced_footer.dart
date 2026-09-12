import 'package:flutter/material.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class LastSyncedFooter extends StatelessWidget {
  final String time;

  const LastSyncedFooter({super.key, this.time = '11:47 AM'});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;

    return Center(
      child: Text(
        '${l10n.lastSyncedToday} $time',
        style: isDark ? AppStyles.lastSyncedDark : AppStyles.lastSyncedLight,
      ),
    );
  }
}
