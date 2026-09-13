import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/features/reports/ui/widgets/payment_method_row.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class CategoryBreakdown extends StatelessWidget {
  final String totalOrders;

  const CategoryBreakdown({super.key, this.totalOrders = '1,247'});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final methods = [
      (l10n.paymentCash, 0.44, isDark ? AppColorsDark.textPrimary : AppColorsLight.textPrimary),
      (l10n.paymentCard, 0.31, isDark ? AppColorsDark.accentOrange : AppColorsLight.accentOrange),
      (l10n.paymentWallet, 0.17, isDark ? AppColorsDark.accentGreen : AppColorsLight.accentGreen),
      (l10n.paymentOther, 0.08, isDark ? AppColorsDark.accentPink : AppColorsLight.accentPink),
    ];

    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(16.w, 14.h, 16.w, 14.h),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: isDark
              ? theme.dividerColor
              : AppColorsLight.border.withValues(alpha: 0.9),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.14 : 0.04),
            blurRadius: 8.r,
            offset: Offset(0, 3.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.salesBreakdown,
            style: isDark
                ? AppStyles.salesOverviewTitleDark
                : AppStyles.salesOverviewTitleLight,
          ),
          SizedBox(height: 2.h),
          Text(
            l10n.byPaymentMethod,
            style: isDark
                ? AppStyles.salesOverviewSubtitleDark
                : AppStyles.salesOverviewSubtitleLight,
          ),
          SizedBox(height: 14.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 78.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      totalOrders,
                      style: isDark
                          ? AppStyles.salesBreakdownBigNumberDark
                          : AppStyles.salesBreakdownBigNumberLight,
                    ),
                    Text(
                      l10n.ordersLabel.toLowerCase(),
                      style: isDark
                          ? AppStyles.salesBreakdownBigLabelDark
                          : AppStyles.salesBreakdownBigLabelLight,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: methods
                      .map(
                        (method) => Padding(
                          padding: EdgeInsets.only(bottom: 9.h),
                          child: PaymentMethodRow(
                            color: method.$3,
                            label: method.$1,
                            fraction: method.$2,
                            isDark: isDark,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


