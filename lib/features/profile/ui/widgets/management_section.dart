import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/features/profile/ui/widgets/management_row.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class ManagementSection extends StatelessWidget {
  const ManagementSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final surface = isDark ? AppColorsDark.surface : AppColorsLight.surface;
    final border = isDark ? AppColorsDark.border : AppColorsLight.border;
    final l10n = AppLocalizations.of(context)!;

    final rows = [
      ManagementRow(
        icon: Icons.people_alt_rounded,
        iconBg: isDark
            ? AppColorsDark.success.withOpacity(0.12)
            : AppColorsLight.successBg,
        iconColor: isDark ? AppColorsDark.success : AppColorsLight.success,
        title: l10n.profileEmployees,
        count: '28',
      ),
      ManagementRow(
        icon: Icons.shopping_bag_rounded,
        iconBg: isDark
            ? AppColorsDark.warning.withOpacity(0.12)
            : AppColorsLight.warningBg,
        iconColor: isDark ? AppColorsDark.warning : AppColorsLight.warning,
        title: l10n.profileCashiers,
        count: '12',
      ),
      ManagementRow(
        icon: Icons.local_shipping_rounded,
        iconBg: isDark
            ? AppColorsDark.primary.withOpacity(0.12)
            : AppColorsLight.infoBg,
        iconColor: isDark ? AppColorsDark.primary : AppColorsLight.primary,
        title: l10n.profileSuppliers,
        count: '94',
      ),
      ManagementRow(
        icon: Icons.swap_horiz_rounded,
        iconBg: isDark
            ? AppColorsDark.accentPurple.withOpacity(0.12)
            : AppColorsLight.accentPurple.withOpacity(0.12),
        iconColor: isDark
            ? AppColorsDark.accentPurple
            : AppColorsLight.accentPurple,
        title: l10n.profileBranches,
        count: '4',
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.management.toUpperCase(),
          style:
              (isDark
                      ? AppStyles.font12MediumDark
                      : AppStyles.font12MediumLight)
                  .copyWith(
                    color: isDark
                        ? AppColorsDark.textPrimary
                        : AppColorsLight.textSecondary,
                    fontSize: 12.sp,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w700,
                  ),
        ),
        SizedBox(height: 12.h),
        Container(
          decoration: BoxDecoration(
            color: surface,
            borderRadius: BorderRadius.circular(18.r),
            border: Border.all(color: border, width: 1.w),
          ),
          child: Column(
            children: List.generate(rows.length, (index) {
              final row = rows[index];
              final isLast = index == rows.length - 1;

              return Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: isLast ? Colors.transparent : border,
                      width: 1.w,
                    ),
                  ),
                ),
                child: row,
              );
            }),
          ),
        ),
      ],
    );
  }
}
