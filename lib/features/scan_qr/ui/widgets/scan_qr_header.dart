import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/local/app_language.dart';
import 'package:skeleton_mobile_app/core/local/locale_cubit.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/core/theming/app_theme_cubit.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class ScanQrHeader extends StatelessWidget {
  const ScanQrHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';

    return Row(
      children: [
        Expanded(
          child: Text(
            l10n.connectToDesktop,
            style: isDark
                ? AppStyles.reportsHeaderTitleDark.copyWith(fontSize: 22.sp)
                : AppStyles.reportsHeaderTitleLight.copyWith(fontSize: 22.sp),
          ),
        ),
        SizedBox(width: 6.w),
        _ScanHeaderAction(
          icon: isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
          tooltip: isDark ? 'Light theme' : 'Dark theme',
          onTap: context.read<AppThemeCubit>().toggleTheme,
        ),
        SizedBox(width: 5.w),
        _ScanHeaderAction(
          icon: Icons.language_rounded,
          tooltip: isArabic ? 'Switch to English' : 'التبديل للعربية',
          onTap: () => context.read<LocaleCubit>().changeLanguage(
            isArabic ? AppLanguage.english : AppLanguage.arabic,
          ),
        ),
      ],
    );
  }
}

class _ScanHeaderAction extends StatelessWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;

  const _ScanHeaderAction({
    required this.icon,
    required this.tooltip,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: IconButton(
        onPressed: onTap,
        icon: Icon(icon, size: 19.sp),
        style: IconButton.styleFrom(
          minimumSize: Size(38.w, 38.w),
          padding: EdgeInsets.zero,
          backgroundColor: Theme.of(context).cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
            side: BorderSide(color: Theme.of(context).dividerColor),
          ),
        ),
      ),
    );
  }
}
