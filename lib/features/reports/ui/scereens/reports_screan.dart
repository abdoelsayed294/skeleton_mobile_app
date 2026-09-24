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
  DateTime selectedMonth = DateTime.now();

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
    final now = DateTime.now();
    final periodBadgeLabel =
        selectedMonth.year == now.year && selectedMonth.month == now.month
        ? l10n.thisMonth
        : l10n.month;

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
                  periodBadgeLabel: periodBadgeLabel,
                  onPrevious: _goToPreviousMonth,
                  onNext: _goToNextMonth,
                ),
                verticalSpace(16),
                TotalSalesCard(selectedMonth: selectedMonth),
                verticalSpace(16),
                TopProductsReportList(selectedMonth: selectedMonth),
                verticalSpace(16),
                RecentTransactionsList(selectedMonth: selectedMonth),
                verticalSpace(20),
                ExportPdfButton(selectedMonth: selectedMonth),
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
