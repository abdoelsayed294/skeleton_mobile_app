import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/features/profit_details/ui/widgets/profit_details_header.dart';
import 'package:skeleton_mobile_app/features/today_sales/ui/widgets/today_items_sold_stat_card.dart';
import 'package:skeleton_mobile_app/features/today_sales/ui/widgets/today_recent_transactions_list.dart';
import 'package:skeleton_mobile_app/features/today_sales/ui/widgets/today_returns_stat_card.dart';
import 'package:skeleton_mobile_app/features/today_sales/ui/widgets/today_total_sales_card.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class TodaySalesScreen extends StatefulWidget {
  const TodaySalesScreen({super.key});

  @override
  State<TodaySalesScreen> createState() => _TodaySalesScreenState();
}

class _TodaySalesScreenState extends State<TodaySalesScreen> {
  DateTime selectedDate = DateTime(2025, 1, 15);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 18.h),
                ProfitDetailsHeader(
                  title: l10n.todaySales,
                  selectedDate: selectedDate,
                  onDateChanged: (date) {
                    setState(() => selectedDate = date);
                  },
                  onBack: () => Navigator.of(context).pop(),
                ),
                SizedBox(height: 16.h),
                const TodayTotalSalesCard(),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    const TodayReturnsStatCard(),
                    SizedBox(width: 12.w),
                    const TodayItemsSoldStatCard(),
                  ],
                ),
                SizedBox(height: 16.h),
                const TodayRecentTransactionsList(),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}