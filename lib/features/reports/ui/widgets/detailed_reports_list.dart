import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/features/home/ui/widgets/section_card.dart';
import 'package:skeleton_mobile_app/features/reports/ui/widgets/report_list_tile.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class DetailedReportsList extends StatelessWidget {
  final ValueChanged<String>? onReportTap;

  const DetailedReportsList({super.key, this.onReportTap});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final reports = [
      (
        l10n.salesReport,
        l10n.salesReportDesc,
        Icons.show_chart_rounded,
        isDark ? AppColorsDark.primary : AppColorsLight.primary,
      ),
      (
        l10n.inventoryReport,
        l10n.inventoryReportDesc,
        Icons.inventory_2_outlined,
        isDark ? AppColorsDark.accentOrange : AppColorsLight.accentOrange,
      ),
      (
        l10n.profitLossReport,
        l10n.profitLossReportDesc,
        Icons.account_balance_wallet_outlined,
        isDark ? AppColorsDark.accentGreen : AppColorsLight.accentGreen,
      ),
      (
        l10n.taxReport,
        l10n.taxReportDesc,
        Icons.receipt_long_outlined,
        isDark ? AppColorsDark.accentPurple : AppColorsLight.accentPurple,
      ),
    ];

    return SectionCard(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.detailedReports.toUpperCase(),
              style: isDark
                  ? AppStyles.productTitleDark
                  : AppStyles.productTitleLight,
            ),
            SizedBox(height: 4.h),
            ...List.generate(reports.length, (index) {
              final report = reports[index];
              return ReportListTile(
                icon: report.$3,
                accentColor: report.$4,
                title: report.$1,
                subtitle: report.$2,
                isDark: isDark,
                isLast: index == reports.length - 1,
                onTap: () => onReportTap?.call(report.$1),
              );
            }),
          ],
        ),
      ),
    );
  }
}
