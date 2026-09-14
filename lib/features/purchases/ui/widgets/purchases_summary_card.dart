import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/features/purchases/ui/widgets/purchase_summary_metric.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class PurchasesSummaryCard extends StatelessWidget {
  const PurchasesSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;
    final primary = isDark ? AppColorsDark.primary : AppColorsLight.primary;
    final muted = isDark ? AppColorsDark.textMuted : AppColorsLight.textMuted;
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 20.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isDark
              ? const [Color(0xFF102638), Color(0xFF14202C)]
              : const [Colors.white, Color(0xFFE7F2FF)],
        ),
        borderRadius: BorderRadius.circular(22.r),
        border: Border.all(
          color: isDark ? AppColorsDark.border : const Color(0xFFD7E9FF),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x121E88E5),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                l10n.totalPurchases,
                style: isDark
                    ? AppStyles.statTitleDark
                    : AppStyles.statTitleLight,
              ),
              const Spacer(),
              Container(
                width: 34.w,
                height: 34.w,
                decoration: BoxDecoration(
                  color: primary.withValues(alpha: .12),
                  borderRadius: BorderRadius.circular(18.r),
                ),
                child: Icon(
                  Icons.shopping_bag_outlined,
                  size: 18.sp,
                  color: primary,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'EGP',
                style: isDark
                    ? AppStyles.font12MediumDark
                    : AppStyles.font12MediumLight,
              ),
              SizedBox(width: 8.w),
              Text(
                '32,450',
                style: isDark
                    ? AppStyles.font24BlackDark
                    : AppStyles.font24BlackLight,
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Icon(Icons.calendar_today_outlined, size: 14.sp, color: muted),
              SizedBox(width: 6.w),
              Text(
                l10n.thisMonth,
                style: isDark
                    ? AppStyles.font12MediumDark
                    : AppStyles.font12MediumLight,
              ),
              SizedBox(width: 12.w),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 3.h),
                decoration: BoxDecoration(
                  color: isDark
                      ? AppColorsDark.successBg
                      : AppColorsLight.successBg,
                  border: Border.all(
                    color: isDark
                        ? AppColorsDark.successBorder
                        : AppColorsLight.successBorder,
                  ),
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: Text(
                  l10n.vsLastMonth,
                  style: isDark
                      ? AppStyles.statChangeDark
                      : AppStyles.statChangeLight,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Expanded(
                child: PurchaseSummaryMetric(
                  title: l10n.ordersUpper,
                  value: '48',
                  subtitle: l10n.purchaseCount,
                  icon: Icons.receipt_long_outlined,
                  color: AppColorsLight.warning,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: PurchaseSummaryMetric(
                  title: l10n.sourcesUpper,
                  value: '12',
                  subtitle: l10n.suppliers,
                  icon: Icons.inventory_2_outlined,
                  color: AppColorsLight.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
