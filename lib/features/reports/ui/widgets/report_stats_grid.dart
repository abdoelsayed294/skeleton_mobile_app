import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/features/home/ui/widgets/statCard.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class ReportStatsGrid extends StatelessWidget {
  const ReportStatsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: StatCard(
                title: l10n.totalRevenue.toUpperCase(),
                value: '68,240',
                unit: l10n.currencyEgp,
                change: '+14.2%',
                icon: Icons.payments_outlined,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: StatCard(
                title: l10n.netProfit.toUpperCase(),
                value: '21,930',
                unit: l10n.currencyEgp,
                change: '+9.6%',
                icon: Icons.trending_up_rounded,
                accentColor: isDark ? AppColorsDark.accentGreen : AppColorsLight.accentGreen,
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              child: StatCard(
                title: l10n.totalOrders.toUpperCase(),
                value: '1,384',
                unit: l10n.orders,
                change: '+6.1%',
                icon: Icons.receipt_long_outlined,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: StatCard(
                title: l10n.avgOrderValue.toUpperCase(),
                value: '49.3',
                unit: l10n.currencyEgp,
                change: '-2.4%',
                icon: Icons.shopping_basket_outlined,
                isNegative: true,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
