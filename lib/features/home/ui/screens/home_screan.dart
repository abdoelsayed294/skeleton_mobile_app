import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/features/home/logic/home_cubit.dart';
import 'package:skeleton_mobile_app/features/home/logic/home_state.dart';
import 'package:skeleton_mobile_app/features/home/ui/widgets/app_bar.dart';
import 'package:skeleton_mobile_app/features/home/ui/widgets/assistant_floating_button.dart';
import 'package:skeleton_mobile_app/features/home/ui/widgets/date_selector.dart';
import 'package:skeleton_mobile_app/features/home/ui/widgets/sales_overview.dart';
import 'package:skeleton_mobile_app/features/home/ui/widgets/stats_grid.dart';
import 'package:skeleton_mobile_app/features/home/ui/widgets/top_selling_products.dart';
import 'package:skeleton_mobile_app/features/home/ui/widgets/low_stock_list.dart';

class HomeScrean extends StatefulWidget {
  const HomeScrean({super.key});

  @override
  State<HomeScrean> createState() => _HomeScreanState();
}

class _HomeScreanState extends State<HomeScrean> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppBarHome(),
                    Divider(
                      color: Theme.of(context).primaryColor,
                      height: 31.h,
                      thickness: 3.h,
                      endIndent: 300.w,
                    ),
                    BlocBuilder<HomeCubit, HomeState>(
                      builder: (context, state) {
                        final summary = state.summaryState.maybeWhen(
                          success: (data) => data,
                          orElse: () => null,
                        );

                        final businessName =
                            summary?.businessSummary.businessName ?? '';
                        final storeName =
                            summary?.storeSummary.storeName ?? '';

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              businessName,
                              style: isDark
                                  ? AppStyles.font24BlackDark
                                  : AppStyles.font24BlackLight,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    storeName,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: isDark
                                        ? AppStyles.font12MediumDark
                                        : AppStyles.font12MediumLight,
                                  ),
                                ),
                                DateSelector(
                                  selectedDate: selectedDate,
                                  onDateChanged: (date) {
                                    setState(() => selectedDate = date);
                                  },
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(height: 20.h),
                    StatsGrid(selectedDate: selectedDate),
                    SizedBox(height: 20.h),
                    SalesOverview(selectedDate: selectedDate),
                    SizedBox(height: 20.h),
                    const TopSellingProducts(),
                    SizedBox(height: 20.h),
                    const LowStockList(),
                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            ),
            const PositionedDirectional(
              end: 16,
              bottom: 8,
              child: AssistantFloatingButton(),
            ),
          ],
        ),
      ),
    );
  }
}
