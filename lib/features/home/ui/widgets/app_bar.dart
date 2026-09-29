import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton/core/helpers/spacing.dart';
import 'package:skeleton/core/local/app_language.dart';
import 'package:skeleton/core/local/locale_cubit.dart';
import 'package:skeleton/core/routing/routes.dart';
import 'package:skeleton/core/theming/app_color.dart';
import 'package:skeleton/core/theming/app_style.dart';
import 'package:skeleton/core/theming/app_theme_cubit.dart';
import 'package:skeleton/core/widgets/shimmer_block.dart';
import 'package:skeleton/features/home/logic/home_cubit.dart';
import 'package:skeleton/features/home/logic/home_state.dart';
import 'package:skeleton/features/home/ui/widgets/app_bar_action.dart';
import 'package:skeleton/l10n/app_localizations.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final isLandscape =
        MediaQuery.sizeOf(context).width > MediaQuery.sizeOf(context).height;
    double side(double value) => isLandscape ? value : value.w;
    double textSize(double value) => isLandscape ? value : value.sp;

    return Row(
      children: [
        Container(
          height: side(36),
          width: side(36),
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
            padding: EdgeInsets.symmetric(
              horizontal: side(2),
              vertical: side(2),
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/images/avater.png',
                width: side(32),
                height: side(32),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        horizontalSpace(side(8)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.goodMorning,
              style: isDark
                  ? AppStyles.font12MediumDark.copyWith(fontSize: textSize(10))
                  : AppStyles.font12MediumLight.copyWith(
                      fontSize: textSize(10),
                    ),
            ),
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                final ownerName = state.summaryState.maybeWhen(
                  success: (data) {
                    final name = data.businessSummary.ownerName?.trim();
                    final businessName = data.businessSummary.businessName
                        .trim();
                    final displayName = name?.isNotEmpty == true
                        ? name!
                        : businessName;
                    if (isArabic && displayName.toLowerCase() == 'skeleton') {
                      return 'سكيلتون';
                    }
                    return displayName;
                  },
                  orElse: () => null,
                );

                if (ownerName == null) {
                  return ShimmerBlock(width: side(62), height: side(15));
                }

                return SizedBox(
                  width: side(150),
                  child: Text(
                    ownerName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: isDark
                        ? AppStyles.font18BoldDark.copyWith(
                            fontSize: textSize(14),
                          )
                        : AppStyles.font18BoldLight.copyWith(
                            fontSize: textSize(14),
                          ),
                  ),
                );
              },
            ),
          ],
        ),
        const Spacer(),
        AppBarAction(
          icon: Icons.storefront_outlined,
          tooltip: AppLocalizations.of(context)!.changeBranch,
          isAccent: true,
          onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(
            Routes.branchSelectionScreen,
            (route) => false,
          ),
        ),
        SizedBox(width: side(5)),
        AppBarAction(
          icon: isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
          tooltip: isDark ? 'Light theme' : 'Dark theme',
          isAccent: true,
          onTap: context.read<AppThemeCubit>().toggleTheme,
        ),
        SizedBox(width: side(5)),
        AppBarAction(
          icon: Icons.language_rounded,
          tooltip: isArabic ? 'Switch to English' : 'التبديل للعربية',
          isAccent: true,
          onTap: () => context.read<LocaleCubit>().changeLanguage(
            isArabic ? AppLanguage.english : AppLanguage.arabic,
          ),
        ),
      ],
    );
  }
}
