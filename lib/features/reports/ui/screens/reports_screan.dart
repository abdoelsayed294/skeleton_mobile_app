import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:skeleton/core/helpers/spacing.dart';
import 'package:skeleton/features/reports/logic/reports_month_cubit.dart';
import 'package:skeleton/features/reports/ui/widgets/export_pdf_button.dart';
import 'package:skeleton/features/reports/ui/widgets/last_synced_footer.dart';
import 'package:skeleton/features/reports/ui/widgets/month_navigator.dart';
import 'package:skeleton/features/reports/ui/widgets/recent_transactions_list.dart';
import 'package:skeleton/features/reports/ui/widgets/reports_app_bar.dart';
import 'package:skeleton/features/reports/ui/widgets/top_products_report_list.dart';
import 'package:skeleton/features/reports/ui/widgets/total_sales_card.dart';
import 'package:skeleton/l10n/app_localizations.dart';

class ReportsScrean extends StatelessWidget {
  const ReportsScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportsMonthCubit, DateTime>(
      builder: (context, selectedMonth) {
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
            child: RefreshIndicator(
              onRefresh: context.read<ReportsMonthCubit>().refresh,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
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
                        onPrevious: context
                            .read<ReportsMonthCubit>()
                            .previousMonth,
                        onNext: context.read<ReportsMonthCubit>().nextMonth,
                      ),
                      verticalSpace(16),
                      const TotalSalesCard(),
                      verticalSpace(16),
                      const TopProductsReportList(),
                      verticalSpace(16),
                      const RecentTransactionsList(),
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
          ),
        );
      },
    );
  }
}
