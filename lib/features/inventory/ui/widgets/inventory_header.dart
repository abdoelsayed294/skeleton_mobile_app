import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/helpers/spacing.dart';
import 'package:skeleton_mobile_app/core/local/app_language.dart';
import 'package:skeleton_mobile_app/core/local/locale_cubit.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/core/theming/app_theme_cubit.dart';
import 'package:skeleton_mobile_app/features/inventory/ui/widgets/inventory_header_action.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InventoryHeader extends StatelessWidget {
  const InventoryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
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
            InventoryHeaderAction(
              icon: isDark
                  ? Icons.light_mode_outlined
                  : Icons.dark_mode_outlined,
              tooltip: isDark ? 'Light theme' : 'Dark theme',
              onTap: context.read<AppThemeCubit>().toggleTheme,
            ),
            horizontalSpace(8.w),
            InventoryHeaderAction(
              icon: Icons.language_rounded,
              tooltip: isArabic ? 'Switch to English' : 'التبديل للعربية',
              onTap: () => context.read<LocaleCubit>().changeLanguage(
                isArabic ? AppLanguage.english : AppLanguage.arabic,
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
