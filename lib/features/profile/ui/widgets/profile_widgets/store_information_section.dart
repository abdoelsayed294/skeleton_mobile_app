import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/features/profile/ui/widgets/profile_widgets/store_information_row.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class StoreInformationSection extends StatelessWidget {
  const StoreInformationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final titleColor = isDark
        ? AppColorsDark.textPrimary
        : AppColorsLight.textPrimary;
    final l10n = AppLocalizations.of(context)!;

    final rows = [
      StoreInformationRow(
        icon: Icons.storefront_rounded,
        iconBackground: const Color(0xFFF6E3B6),
        iconColor: const Color(0xFFCC8D1B),
        label: l10n.storeName,
        value: "Bennett's Retail Group",
      ),
      StoreInformationRow(
        icon: Icons.phone_rounded,
        iconBackground: const Color(0xFFDAEEF8),
        iconColor: const Color(0xFF5AA4D8),
        label: l10n.phoneNumber,
        value: '+1 (555) 204-8831',
      ),
      StoreInformationRow(
        icon: Icons.location_on_rounded,
        iconBackground: const Color(0xFFF7DFD6),
        iconColor: const Color(0xFFE67E52),
        label: l10n.address,
        value: '124 Commerce Ave, NY 10001',
      ),
      StoreInformationRow(
        icon: Icons.work_rounded,
        iconBackground: const Color(0xFFDDEBF8),
        iconColor: const Color(0xFF5AA4D8),
        label: l10n.businessType,
        value: 'Retail — Multi-Branch',
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.storeInformation.toUpperCase(),
          style:
              (isDark
                      ? AppStyles.font12MediumDark
                      : AppStyles.font12MediumLight)
                  .copyWith(
                    color: titleColor,
                    fontSize: 12.sp,
                    letterSpacing: 0.5,
                  ),
        ),
        SizedBox(height: 12.h),
        Container(
          decoration: BoxDecoration(
            color: isDark ? AppColorsDark.surface : AppColorsLight.surface,
            borderRadius: BorderRadius.circular(18.r),
            border: Border.all(
              color: isDark ? AppColorsDark.border : AppColorsLight.border,
              width: 1.w,
            ),
          ),
          child: Column(
            children: List.generate(rows.length, (index) {
              final row = rows[index];
              final isLast = index == rows.length - 1;

              return Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: isLast
                          ? Colors.transparent
                          : (isDark
                                ? AppColorsDark.border
                                : AppColorsLight.border),
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
