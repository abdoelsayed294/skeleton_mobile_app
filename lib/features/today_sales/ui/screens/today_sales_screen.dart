import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/features/profit_details/ui/widgets/profit_details_header.dart';
import 'package:skeleton_mobile_app/features/reports/ui/widgets/items_sold_stat_card.dart';
import 'package:skeleton_mobile_app/features/reports/ui/widgets/recent_transactions_list.dart';
import 'package:skeleton_mobile_app/features/reports/ui/widgets/returns_stat_card.dart';
import 'package:skeleton_mobile_app/features/reports/ui/widgets/total_sales_card.dart';
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
                const TotalSalesCard(),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    const ReturnsStatCard(),
                    SizedBox(width: 12.w),
                    const ItemsSoldStatCard(),
                  ],
                ),
                SizedBox(height: 16.h),
                const RecentTransactionsList(),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}