import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';

class PurchasesHeaderIcon extends StatelessWidget {
  final IconData icon;
  final bool isProfile;

  const PurchasesHeaderIcon({
    super.key,
    required this.icon,
    this.isProfile = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final color = isProfile
        ? (isDark ? AppColorsDark.warning : AppColorsLight.warning)
        : (isDark ? AppColorsDark.textSecondary : AppColorsLight.textSecondary);
    return Container(
      width: 40.w,
      height: 40.w,
      decoration: BoxDecoration(
        color: isDark ? AppColorsDark.surface : AppColorsLight.surface,
        shape: BoxShape.circle,
        border: Border.all(
          color: isProfile
              ? (isDark
                    ? AppColorsDark.warning.withValues(alpha: .35)
                    : AppColorsLight.warningAlt.withValues(alpha: .35))
              : (isDark ? AppColorsDark.border : AppColorsLight.border),
        ),
        boxShadow: const [BoxShadow(color: Color(0x0D1E88E5), blurRadius: 5)],
      ),
      child: Icon(icon, size: 20.sp, color: color),
    );
  }
}
