import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/features/purchases/ui/widgets/purchases_header_icon.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class PurchasesAppBar extends StatelessWidget {
  const PurchasesAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).toLanguageTag();
    final monthLabel = DateFormat(
      'MMM yyyy',
      locale,
    ).format(DateTime(2024, 11));
    final surface = isDark ? AppColorsDark.surface : AppColorsLight.surface;
    final border = isDark ? AppColorsDark.border : AppColorsLight.border;
    final primary = isDark ? AppColorsDark.primary : AppColorsLight.primary;
    final muted = isDark ? AppColorsDark.textMuted : AppColorsLight.textMuted;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              l10n.purchases,
              style: isDark
                  ? AppStyles.font24BlackDark
                  : AppStyles.font24BlackLight,
            ),
            const Spacer(),
            const PurchasesHeaderIcon(icon: Icons.fullscreen_rounded),
            SizedBox(width: 10.w),
            const PurchasesHeaderIcon(
              icon: Icons.person_outline_rounded,
              isProfile: true,
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 7.h),
          decoration: BoxDecoration(
            color: surface,
            borderRadius: BorderRadius.circular(18.r),
            border: Border.all(color: border),
            boxShadow: const [
              BoxShadow(color: Color(0x0D1E88E5), blurRadius: 5),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.calendar_today_outlined, size: 14.sp, color: primary),
              SizedBox(width: 8.w),
              Text(
                monthLabel,
                style:
                    (isDark
                            ? AppStyles.font12MediumDark
                            : AppStyles.font12MediumLight)
                        .copyWith(
                          color: isDark
                              ? AppColorsDark.textPrimary
                              : AppColorsLight.textPrimary,
                        ),
              ),
              SizedBox(width: 12.w),
              Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 17.sp,
                color: muted,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
