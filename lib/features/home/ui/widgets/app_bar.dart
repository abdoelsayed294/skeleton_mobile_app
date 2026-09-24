import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/helpers/spacing.dart';
import 'package:skeleton_mobile_app/core/local/app_language.dart';
import 'package:skeleton_mobile_app/core/local/locale_cubit.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/core/theming/app_theme_cubit.dart';
import 'package:skeleton_mobile_app/core/widgets/shimmer_block.dart';
import 'package:skeleton_mobile_app/features/home/logic/home_cubit.dart';
import 'package:skeleton_mobile_app/features/home/logic/home_state.dart';
import 'package:skeleton_mobile_app/features/home/ui/widgets/app_bar_action.dart';
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
                  return ShimmerBlock(width: 62.w, height: 15.h);
                }

                return SizedBox(
                  width: 115.w,
                  child: Text(
                    ownerName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: isDark
                        ? AppStyles.font18BoldDark.copyWith(fontSize: 14.sp)
                        : AppStyles.font18BoldLight.copyWith(fontSize: 14.sp),
                  ),
                );
              },
            ),
          ],
        ),
        const Spacer(),
        AppBarAction(
          icon: isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
          tooltip: isDark ? 'Light theme' : 'Dark theme',
          onTap: context.read<AppThemeCubit>().toggleTheme,
        ),
        SizedBox(width: 5.w),
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
