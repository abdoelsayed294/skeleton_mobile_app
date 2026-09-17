import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class WeeklyProfitSummaryCard extends StatelessWidget {
  const WeeklyProfitSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;
    final primary = isDark ? AppColorsDark.primary : AppColorsLight.primary;
    final days = [
      (l10n.dayMon, 0.62, '4.8K'),
      (l10n.dayTue, 0.72, '5.2K'),
      (l10n.dayWed, 0.61, '4.7K'),
      (l10n.dayThu, 0.80, '5.7K'),
      (l10n.dayFri, 0.86, '6.0K'),
      (l10n.daySat, 0.92, '6.3K'),
      (l10n.today, 1.0, '6.6K'),
    ];

    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 14.h),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.weeklyProfitSummary,
            style: isDark
                ? AppStyles.productTitleDark
                : AppStyles.productTitleLight,
          ),
          SizedBox(height: 3.h),
          Text(
            l10n.last7DaysPerformance,
            style: isDark
                ? AppStyles.productSubtitleDark
                : AppStyles.productSubtitleLight,
          ),
          SizedBox(height: 18.h),
          SizedBox(
            height: 124.h,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: days
                  .map(
                    (day) => Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            if (day.$1 == l10n.today)
                              Text(
                                day.$3,
                                style: AppStyles.topProductChangeLight.copyWith(
                                  color: primary,
                                ),
                              ),
                            SizedBox(height: 4.h),
                            Expanded(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: FractionallySizedBox(
                                  heightFactor: day.$2,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: primary.withValues(
                                        alpha: day.$1 == l10n.today ? 1 : 0.68,
                                      ),
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(7.r),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 7.h),
                            Text(
                              day.$1,
                              style: isDark
                                  ? AppStyles.txnMetaDark
                                  : AppStyles.txnMetaLight,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          SizedBox(height: 12.h),
          Divider(height: 1, color: Theme.of(context).dividerColor),
          SizedBox(height: 12.h),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.weekTotal,
                    style: isDark
                        ? AppStyles.productSubtitleDark
                        : AppStyles.productSubtitleLight,
                  ),
                  SizedBox(height: 3.h),
                  Text(
                    '38,420 ${l10n.currencyEgp}',
                    style: isDark
                        ? AppStyles.topProductPriceDark
                        : AppStyles.topProductPriceLight,
                  ),
                ],
              ),
              const Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: AppColorsLight.successBg,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Text(
                  '+15.3% ${l10n.lastWeek}',
                  style: AppStyles.topProductChangeLight,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
