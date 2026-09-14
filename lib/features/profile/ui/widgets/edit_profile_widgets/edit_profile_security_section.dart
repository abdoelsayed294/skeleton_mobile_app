import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/features/profile/ui/widgets/edit_profile_widgets/edit_profile_security_tile.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class EditProfileSecuritySection extends StatefulWidget {
  const EditProfileSecuritySection({super.key});

  @override
  State<EditProfileSecuritySection> createState() =>
      _EditProfileSecuritySectionState();
}

class _EditProfileSecuritySectionState
    extends State<EditProfileSecuritySection> {
  bool twoFactorEnabled = true;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;
    final surface = isDark ? AppColorsDark.surface : AppColorsLight.surface;
    final fill = isDark ? AppColorsDark.background : AppColorsLight.infoBg;
    final border = isDark ? AppColorsDark.border : AppColorsLight.border;
    final primary = isDark ? AppColorsDark.primary : AppColorsLight.primary;
    final text = isDark
        ? AppColorsDark.textPrimary
        : AppColorsLight.textPrimary;
    final muted = isDark
        ? AppColorsDark.textSecondary
        : AppColorsLight.textSecondary;
    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 20.h, 16.w, 20.h),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: border),
        boxShadow: isDark
            ? const []
            : const [BoxShadow(color: Color(0x091E88E5), blurRadius: 8)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.shield_rounded, color: primary, size: 20.sp),
              SizedBox(width: 8.w),
              Text(
                l10n.securityAccess,
                style:
                    (isDark
                            ? AppStyles.font16BoldDark
                            : AppStyles.font16BoldLight)
                        .copyWith(fontSize: 16.sp),
              ),
            ],
          ),
          SizedBox(height: 18.h),
          EditProfileSecurityTile(
            icon: Icons.key_rounded,
            title: l10n.changePassword,
            subtitle: l10n.lastUpdatedDaysAgo(42),
            fill: fill,
            border: border,
            primary: primary,
            text: text,
            muted: muted,
            trailing: Icons.chevron_right_rounded,
          ),
          SizedBox(height: 12.h),
          EditProfileSecurityTile(
            icon: Icons.phone_locked_outlined,
            title: l10n.twoFactorAuthentication,
            subtitle: l10n.smsAuthenticatorActive,
            fill: fill,
            border: border,
            primary: primary,
            text: text,
            muted: muted,
            isEnabled: twoFactorEnabled,
            onToggle: (value) => setState(() => twoFactorEnabled = value),
          ),
        ],
      ),
    );
  }
}
