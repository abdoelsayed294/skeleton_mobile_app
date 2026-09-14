import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/features/profile/ui/widgets/edit_profile_widgets/edit_profile_hero_stat.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class EditProfileHero extends StatelessWidget {
  const EditProfileHero({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;
    final primary = isDark ? AppColorsDark.primary : AppColorsLight.primary;
    final muted = isDark
        ? AppColorsDark.textSecondary
        : AppColorsLight.textSecondary;
    final surface = isDark ? AppColorsDark.surface : AppColorsLight.surface;
    final border = isDark ? AppColorsDark.border : AppColorsLight.border;
    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 24.h, 16.w, 20.h),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: border),
        boxShadow: isDark
            ? const []
            : const [
                BoxShadow(
                  color: Color(0x0A1E88E5),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
      ),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 96.w,
                height: 96.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isDark ? primary.withValues(alpha: .8) : primary,
                  shape: isDark ? BoxShape.rectangle : BoxShape.circle,
                  borderRadius: isDark ? BorderRadius.circular(14.r) : null,
                  boxShadow: isDark
                      ? [
                          BoxShadow(
                            color: primary.withValues(alpha: .35),
                            blurRadius: 18,
                          ),
                        ]
                      : const [
                          BoxShadow(
                            color: Color(0x331E88E5),
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                ),
                child: Text(
                  'MB',
                  style: AppStyles.font24BoldLight.copyWith(
                    color: Colors.white,
                    fontSize: 30.sp,
                  ),
                ),
              ),
              Positioned(
                right: -2.w,
                bottom: -2.h,
                child: Container(
                  width: 28.w,
                  height: 28.w,
                  decoration: BoxDecoration(
                    color: primary,
                    shape: BoxShape.circle,
                    border: Border.all(color: surface, width: 2.w),
                  ),
                  child: Icon(
                    Icons.camera_alt_outlined,
                    size: 15.sp,
                    color: isDark ? AppColorsDark.background : Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Text(
            'Marcus Bennett',
            style:
                (isDark ? AppStyles.font18BoldDark : AppStyles.font18BoldLight)
                    .copyWith(fontSize: 23.sp),
          ),
          SizedBox(height: 5.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 3.h),
            decoration: BoxDecoration(
              color: primary.withValues(alpha: isDark ? .12 : .16),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Text(
              l10n.storeOwner,
              style:
                  (isDark
                          ? AppStyles.font12MediumDark
                          : AppStyles.font12MediumLight)
                      .copyWith(
                        color: primary,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w700,
                      ),
            ),
          ),
          SizedBox(height: 16.h),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            decoration: BoxDecoration(
              color: isDark ? AppColorsDark.background : AppColorsLight.infoBg,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Row(
              children: [
                Expanded(
                  child: EditProfileHeroStat(
                    label: l10n.profileBranches.toUpperCase(),
                    value: l10n.activeBranches(4),
                    color: primary,
                    muted: muted,
                  ),
                ),
                Expanded(
                  child: EditProfileHeroStat(
                    label: l10n.memberSince,
                    value: 'Oct 2021',
                    color: primary,
                    muted: muted,
                  ),
                ),
                Expanded(
                  child: EditProfileHeroStat(
                    label: l10n.status,
                    value: l10n.verified,
                    color: primary,
                    muted: muted,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
