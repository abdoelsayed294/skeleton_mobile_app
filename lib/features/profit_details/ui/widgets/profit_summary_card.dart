import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class ProfitSummaryCard extends StatelessWidget {
  const ProfitSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;
    final gradientColors = isDark
        ? [AppColorsDark.primaryGradientStart, AppColorsDark.primaryGradientEnd]
        : [AppColorsLight.primaryGradientStart, AppColorsLight.primary];
    final amountStyle = AppStyles.totalSalesAmountLight.copyWith(fontSize: 36);
    final metadataStyle = AppStyles.totalSalesCompareLight.copyWith(
      fontSize: 12,
    );

    return Container(
      height: 198.h,
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: gradientColors.last.withValues(alpha: 0.3),
            blurRadius: 14.r,
            offset: Offset(0, 7.h),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -38.w,
            bottom: -48.h,
            child: Container(
              width: 148.w,
              height: 148.w,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.08),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.w, 18.h, 18.w, 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.netProfit.toUpperCase(),
                  style: AppStyles.totalSalesLabelLight,
                ),
                SizedBox(height: 5.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text('6,630', style: amountStyle),
                    SizedBox(width: 5.w),
                    Text(
                      l10n.currencyEgp,
                      style: AppStyles.totalSalesUnitLight,
                    ),
                  ],
                ),
                Text('EGP · ${l10n.today}', style: metadataStyle),
                const Spacer(),
                Container(
                  height: 1,
                  color: Colors.white.withValues(alpha: 0.16),
                ),
                SizedBox(height: 14.h),
                Row(
                  children: [
                    Text('${l10n.vsYesterday}: ', style: metadataStyle),
                    Text(
                      '5,586 ${l10n.currencyEgp}',
                      style: metadataStyle.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const Spacer(),
                    Text('${l10n.margin}: ', style: metadataStyle),
                    Text(
                      '53.3%',
                      style: metadataStyle.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 22.h,
            right: 20.w,
            child: Container(
              width: 52.w,
              height: 52.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: Colors.white.withValues(alpha: 0.24)),
              ),
              child: Text(
                'S\$',
                style: AppStyles.totalSalesStatValueLight.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Positioned(
            top: 88.h,
            right: 20.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.14),
                borderRadius: BorderRadius.circular(18.r),
                border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
              ),
              child: Text('+18.7%  ↗', style: AppStyles.totalSalesChangeLight),
            ),
          ),
        ],
      ),
    );
  }
}
