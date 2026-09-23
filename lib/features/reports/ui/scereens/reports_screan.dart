import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:skeleton_mobile_app/core/helpers/spacing.dart';
import 'package:skeleton_mobile_app/features/reports/ui/widgets/export_pdf_button.dart';
import 'package:skeleton_mobile_app/features/reports/ui/widgets/last_synced_footer.dart';
import 'package:skeleton_mobile_app/features/reports/ui/widgets/month_navigator.dart';
import 'package:skeleton_mobile_app/features/reports/ui/widgets/recent_transactions_list.dart';
import 'package:skeleton_mobile_app/features/reports/ui/widgets/reports_app_bar.dart';
import 'package:skeleton_mobile_app/features/reports/ui/widgets/top_products_report_list.dart';
import 'package:skeleton_mobile_app/features/reports/ui/widgets/total_sales_card.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class ReportsScrean extends StatefulWidget {
  const ReportsScrean({super.key});

  @override
  State<ReportsScrean> createState() => _ReportsScreanState();
}

class _ReportsScreanState extends State<ReportsScrean> {
  DateTime selectedMonth = DateTime(2024, 11);

  void _goToPreviousMonth() {
    setState(() {
      selectedMonth = DateTime(selectedMonth.year, selectedMonth.month - 1);
    });
  }

  void _goToNextMonth() {
    setState(() {
      selectedMonth = DateTime(selectedMonth.year, selectedMonth.month + 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).languageCode;
    final monthLabel = DateFormat('MMM yyyy', locale).format(selectedMonth);
    final monthName = DateFormat('MMMM', locale).format(selectedMonth);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(6),
                ReportsAppBar(),
                verticalSpace(16),
                MonthNavigator(
                  monthLabel: monthLabel,
                  periodBadgeLabel: l10n.thisMonth,
                  onPrevious: _goToPreviousMonth,
                  onNext: _goToNextMonth,
                ),
                verticalSpace(16),
                const TotalSalesCard(),
                verticalSpace(16),
                const TopProductsReportList(),
                verticalSpace(16),
                const RecentTransactionsList(),
                verticalSpace(20),
                ExportPdfButton(
                  onTap: () {
                    // TODO: wire up export/share flow (PDF / Excel).
                  },
                ),
                verticalSpace(10),
                const LastSyncedFooter(),
                verticalSpace(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
