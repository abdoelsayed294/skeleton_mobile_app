import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';

class InventoryStatCard extends StatelessWidget {
  final String value;
  final String label;
  final IconData icon;
  final Color color;

  const InventoryStatCard({
    super.key,
    required this.value,
    required this.label,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final landscape =
        MediaQuery.sizeOf(context).width > MediaQuery.sizeOf(context).height;
    final height = landscape ? 108.0 : 108.h;
    final spacing = landscape ? 13.0 : 13.h;
    final iconPadding = landscape ? 8.0 : 8.w;
    final iconSize = landscape ? 17.0 : 17.sp;
    return Container(
      height: height,
      padding: EdgeInsets.symmetric(vertical: spacing),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: theme.dividerColor),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(iconPadding),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(9.r),
            ),
            child: Icon(icon, size: iconSize, color: color),
          ),
          Text(
            value,
            style: (isDark ? AppStyles.statValueDark : AppStyles.statValueLight)
                .copyWith(color: color),
          ),
          Text(
            label,
            style: (isDark ? AppStyles.statTitleDark : AppStyles.statTitleLight)
                .copyWith(fontSize: landscape ? 9 : 9.sp),
          ),
        ],
      ),
    );
  }
}
