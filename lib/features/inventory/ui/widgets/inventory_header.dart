import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton/core/theming/app_style.dart';
import 'package:skeleton/l10n/app_localizations.dart';

class InventoryHeader extends StatelessWidget {
  const InventoryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final titleStyle = isDark
        ? AppStyles.font24BlackDark
        : AppStyles.font24BlackLight;
    final subtitleStyle = isDark
        ? AppStyles.font12MediumDark
        : AppStyles.font12MediumLight;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                AppLocalizations.of(context)!.storeDashboard.toUpperCase(),
                style: subtitleStyle.copyWith(
                  color: theme.primaryColor,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.1,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 4.h),
        Text(AppLocalizations.of(context)!.inventory, style: titleStyle),
        SizedBox(height: 14.h),
      ],
    );
  }
}
