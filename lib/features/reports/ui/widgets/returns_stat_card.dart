import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';
import 'package:skeleton_mobile_app/features/reports/ui/widgets/stat_change_badge.dart';

class ReturnsStatCard extends StatelessWidget {
  const ReturnsStatCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;
    final accent = isDark ? AppColorsDark.error : AppColorsLight.error;

    return Expanded(
      child: Container(
        height: 116.h,
        padding: EdgeInsets.fromLTRB(13.w, 12.h, 13.w, 10.h),
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: theme.dividerColor),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 8.r,
              offset: Offset(0, 3.h),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    l10n.returns.toUpperCase(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: isDark
                        ? AppStyles.statTitleDark
                        : AppStyles.statTitleLight,
                  ),
                ),
                Icon(Icons.keyboard_return_rounded, size: 16.sp, color: accent),
              ],
            ),
            SizedBox(height: 8.h),
            Text(
              '320',
              style: isDark
                  ? AppStyles.statValueDark
                  : AppStyles.statValueLight,
            ),
            Text(
              '${l10n.currencyEgp} · 6 ${l10n.orders}',
              style: isDark ? AppStyles.statUnitDark : AppStyles.statUnitLight,
            ),
            const Spacer(),
            StatChangeBadge(label: '-2.1%', color: accent),
          ],
        ),
      ),
    );
  }
}
