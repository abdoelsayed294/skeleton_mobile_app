import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/features/home/ui/widgets/section_card.dart';
import 'package:skeleton_mobile_app/features/product_details/ui/widgets/sold_row.dart';

class ProductInventorySection extends StatelessWidget {
  final int currentStock;
  final int minimumStock;
  final int soldToday;
  final int soldThisWeek;
  final int soldThisMonth;

  const ProductInventorySection({
    super.key,
    required this.currentStock,
    required this.minimumStock,
    required this.soldToday,
    required this.soldThisWeek,
    required this.soldThisMonth,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final warningColor = isDark ? AppColorsDark.warningAlt : AppColorsLight.warning;
    final warningBg = isDark ? AppColorsDark.warningBorder : AppColorsLight.warningBg;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'INVENTORY',
          style: isDark ? AppStyles.statTitleDark : AppStyles.statTitleLight,
        ),
        SizedBox(height: 10.h),
        Container(
          padding: EdgeInsets.all(14.w),
          decoration: BoxDecoration(
            color: warningBg.withValues(alpha: isDark ? 1 : 0.5),
            borderRadius: BorderRadius.circular(14.r),
            border: Border.all(color: warningColor.withValues(alpha: 0.35)),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Current Stock',
                      style: (isDark ? AppStyles.font12MediumDark : AppStyles.font12MediumLight)
                          .copyWith(color: warningColor),
                    ),
                    SizedBox(height: 6.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '$currentStock',
                          style: isDark ? AppStyles.stockTitleDark : AppStyles.stockTitleLight,
                        ),
                        SizedBox(width: 4.w),
                        Padding(
                          padding: EdgeInsets.only(bottom: 3.h),
                          child: Text(
                            'units',
                            style: isDark
                                ? AppStyles.font12MediumDark
                                : AppStyles.font12MediumLight,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: 40.w,
                height: 40.w,
                decoration: BoxDecoration(
                  color: warningColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(Icons.store_mall_directory_outlined, size: 20.sp, color: warningColor),
              ),
            ],
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: warningColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            children: [
              Icon(Icons.warning_amber_rounded, size: 15.sp, color: warningColor),
              SizedBox(width: 6.w),
              Expanded(
                child: Text(
                  'Minimum Stock Level',
                  style: isDark ? AppStyles.font12MediumDark : AppStyles.font12MediumLight,
                ),
              ),
              Text(
                '$minimumStock units',
                style: (isDark ? AppStyles.stockItemDark : AppStyles.stockItemLight)
                    .copyWith(color: warningColor),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        SectionCard(
          child: Padding(
            padding: EdgeInsets.only(bottom: 2.h),
            child: Column(
              children: [
                SoldRow(dotColor: Theme.of(context).primaryColor, label: 'Units Sold Today', value: soldToday),
                SoldRow(dotColor: Theme.of(context).primaryColor, label: 'Units Sold This Week', value: soldThisWeek),
                SoldRow(
                  dotColor: isDark ? AppColorsDark.textMuted : AppColorsLight.textMuted,
                  label: 'Units Sold This Month',
                  value: soldThisMonth,
                  isLast: true,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

