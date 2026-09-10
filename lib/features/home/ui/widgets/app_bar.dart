import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/helpers/spacing.dart';
import 'package:skeleton_mobile_app/core/local/app_language.dart';
import 'package:skeleton_mobile_app/core/local/locale_cubit.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/core/theming/app_theme_cubit.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';

    return Row(
      children: [
        Container(
          height: 36.h,
          width: 36.w,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: isDark
                  ? [
                      AppColorsDark.primaryGradientStart,
                      AppColorsDark.primaryGradientEnd,
                    ]
                  : [
                      AppColorsLight.primaryGradientStart,
                      AppColorsLight.primaryGradientEnd,
                    ],
            ),
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
            child: const CircleAvatar(backgroundColor: Colors.white),
          ),
        ),
        horizontalSpace(8.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.goodMorning,
              style: isDark
                  ? AppStyles.font12MediumDark.copyWith(fontSize: 10.sp)
                  : AppStyles.font12MediumLight.copyWith(fontSize: 10.sp),
            ),
            Text(
              'Medo',
              style: isDark
                  ? AppStyles.font18BoldDark.copyWith(fontSize: 14.sp)
                  : AppStyles.font18BoldLight.copyWith(fontSize: 14.sp),
            ),
          ],
        ),
        const Spacer(),
        _AppBarAction(
          icon: isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
          tooltip: isDark ? 'Light theme' : 'Dark theme',
          onTap: context.read<AppThemeCubit>().toggleTheme,
        ),
        SizedBox(width: 5.w),
        _AppBarAction(
          icon: Icons.language_rounded,
          tooltip: isArabic ? 'Switch to English' : 'التبديل للعربية',
          isAccent: true,
          onTap: () => context.read<LocaleCubit>().changeLanguage(
            isArabic ? AppLanguage.english : AppLanguage.arabic,
          ),
        ),
        SizedBox(width: 5.w),
        _AppBarAction(
          icon: Icons.notifications_none_rounded,
          tooltip: 'Notifications',
        ),
      ],
    );
  }
}

class _AppBarAction extends StatelessWidget {
  final IconData icon;
  final String tooltip;
  final bool isAccent;
  final VoidCallback? onTap;

  const _AppBarAction({
    required this.icon,
    required this.tooltip,
    this.isAccent = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final accent = theme.primaryColor;
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(11.r),
        child: Container(
          width: 34.w,
          height: 34.w,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: isAccent
                  ? [accent.withValues(alpha: 0.14), theme.cardColor]
                  : [theme.cardColor, theme.cardColor.withValues(alpha: 0.86)],
            ),
            borderRadius: BorderRadius.circular(11.r),
            border: Border.all(
              color: isAccent
                  ? accent.withValues(alpha: 0.35)
                  : theme.dividerColor.withValues(alpha: 0.9),
              width: 1.w,
            ),
            boxShadow: [
              BoxShadow(
                color: accent.withValues(alpha: isAccent ? 0.12 : 0.06),
                blurRadius: 5.r,
                offset: Offset(0, 2.h),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 15.sp,
                color: isAccent ? accent : theme.canvasColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
