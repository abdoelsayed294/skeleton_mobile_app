import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';

class ProductOverviewSection extends StatelessWidget {
  final String name;
  final String subtitle;
  final String category;
  final IconData icon;
  final bool inStock;

  const ProductOverviewSection({
    super.key,
    required this.name,
    required this.subtitle,
    required this.category,
    required this.icon,
    required this.inStock,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final successColor = isDark ? AppColorsDark.success : AppColorsLight.success;
    final errorColor = isDark ? AppColorsDark.error : AppColorsLight.error;
    final statusColor = inStock ? successColor : errorColor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 190.h,
          padding: EdgeInsets.all(14.w),
          decoration: BoxDecoration(
            color: isDark ? AppColorsDark.surface : AppColorsLight.background,
            borderRadius: BorderRadius.circular(18.r),
            border: Border.all(
              color: isDark ? AppColorsDark.border : AppColorsLight.border,
            ),
          ),
          child: Stack(
            children: [
              Center(
                child: Icon(
                  icon,
                  size: 78.sp,
                  color: theme.primaryColor.withValues(alpha: 0.35),
                ),
              ),
              Align(
                alignment: AlignmentDirectional.topEnd,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: statusColor.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 6.w,
                        height: 6.w,
                        decoration: BoxDecoration(
                          color: statusColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        inStock ? 'IN STOCK' : 'OUT OF STOCK',
                        style: (isDark ? AppStyles.stockBadgeDark : AppStyles.stockBadgeLight)
                            .copyWith(color: statusColor),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional.bottomStart,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                  decoration: BoxDecoration(
                    color: theme.cardColor,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    category,
                    style: (isDark ? AppStyles.font12MediumDark : AppStyles.font12MediumLight)
                        .copyWith(color: theme.primaryColor, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        Text(
          name,
          style: isDark ? AppStyles.font24BoldDark : AppStyles.font24BoldLight,
        ),
        SizedBox(height: 4.h),
        Text(
          subtitle,
          style: isDark ? AppStyles.font12MediumDark : AppStyles.font12MediumLight,
        ),
      ],
    );
  }
}
