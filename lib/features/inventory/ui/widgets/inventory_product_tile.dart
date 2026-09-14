import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/features/inventory/ui/widgets/inventory_status_badge.dart';
import 'package:skeleton_mobile_app/features/inventory/ui/widgets/stock_status.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class InventoryProductTile extends StatelessWidget {
  final String name;
  final String category;
  final String quantity;
  final String minimum;
  final String price;
  final StockStatus status;
  final IconData icon;
  final bool isLast;

  const InventoryProductTile({
    super.key,
    required this.name,
    required this.category,
    required this.quantity,
    required this.minimum,
    required this.price,
    required this.status,
    required this.icon,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;
    final statusColor = switch (status) {
      StockStatus.inStock =>
        isDark ? AppColorsDark.success : AppColorsLight.success,
      StockStatus.low =>
        isDark ? AppColorsDark.warningAlt : AppColorsLight.warningAlt,
      StockStatus.out =>
        isDark ? AppColorsDark.errorAlt : AppColorsLight.errorAlt,
    };
    final statusLabel = switch (status) {
      StockStatus.inStock => l10n.inStock,
      StockStatus.low => l10n.lowStock,
      StockStatus.out => l10n.outOfStock,
    };
    final progress = status == StockStatus.out
        ? 0.0
        : (int.parse(quantity) / int.parse(minimum)).clamp(0.0, 1.0);
    return Container(
      margin: EdgeInsets.only(bottom: isLast ? 0 : 12.h),
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: theme.dividerColor),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 64.w,
                height: 64.w,
                decoration: BoxDecoration(
                  color: theme.primaryColor.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  icon,
                  color: theme.primaryColor.withValues(alpha: 0.55),
                  size: 28.sp,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: isDark
                          ? AppStyles.productTitleDark
                          : AppStyles.productTitleLight,
                    ),
                    SizedBox(height: 3.h),
                    Text(
                      category,
                      style: isDark
                          ? AppStyles.productSubtitleDark
                          : AppStyles.productSubtitleLight,
                    ),
                  ],
                ),
              ),
              InventoryStatusBadge(label: statusLabel, color: statusColor),
            ],
          ),
          SizedBox(height: 12.h),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 6.h,
              backgroundColor: theme.dividerColor.withValues(alpha: 0.45),
              valueColor: AlwaysStoppedAnimation(statusColor),
            ),
          ),
          SizedBox(height: 7.h),
          Row(
            children: [
              Text(
                '$quantity / ${l10n.minimumStock}$minimum',
                style: isDark
                    ? AppStyles.font12MediumDark
                    : AppStyles.font12MediumLight,
              ),
              const Spacer(),
              Text(
                '${l10n.currencyEgp} $price',
                style: isDark
                    ? AppStyles.font16BoldDark
                    : AppStyles.font16BoldLight,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
