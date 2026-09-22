import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/helpers/shared_pref_helper.dart';
import 'package:skeleton_mobile_app/core/routing/routes.dart';
import 'package:skeleton_mobile_app/core/widgets/dilaog_utils.dart';
import 'package:skeleton_mobile_app/features/home/logic/home_cubit.dart';
import 'package:skeleton_mobile_app/features/home/logic/home_state.dart';
import 'package:skeleton_mobile_app/features/home/ui/widgets/statCard.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class StatsGrid extends StatefulWidget {
  final DateTime selectedDate;

  const StatsGrid({super.key, required this.selectedDate});

  @override
  State<StatsGrid> createState() => _StatsGridState();
}

class _StatsGridState extends State<StatsGrid> {
  int selectedCardIndex = 0;

  @override
  void initState() {
    super.initState();
    _getSummary(widget.selectedDate);
  }

  @override
  void didUpdateWidget(StatsGrid oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedDate != widget.selectedDate) {
      _getSummary(widget.selectedDate);
    }
  }

  Future<void> _getSummary(DateTime date) async {
    final storeId = await SharedPrefHelper.getInt(
      SharedPrefHelper.storeIdKey,
    );

    if (!mounted) return;

    context.read<HomeCubit>().getSummary(
      storeId: storeId,
      date: date,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocConsumer<HomeCubit, HomeState>(
      listenWhen: (previous, current) =>
          current.summaryState is RequestError &&
          previous.summaryState is! RequestError,
      listener: (context, state) {
        state.summaryState.whenOrNull(
          error: (apiErrorModel) {
            DialogUtils.showMessage(
              context: context,
              type: DialogType.error,
              title: 'خطأ',
              message:
                  apiErrorModel.error?.message ??
                  'حصل خطأ، حاول تاني',
            );
          },
        );
      },
      builder: (context, state) {
        if (state.summaryState is RequestLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final summary = state.summaryState.maybeWhen(
          success: (data) => data,
          orElse: () => null,
        );

        if (summary == null) {
          return const SizedBox.shrink();
        }

        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: StatCard(
                    title: l10n.todaySales.toUpperCase(),
                    value: '${summary.todaySales}',
                    unit: 'EGP',
                    change: '${summary.salesChangePct}%',
                    icon: Icons.shopping_bag_outlined,
                    isSelected: selectedCardIndex == 0,
                    onTap: () {
                      setState(() => selectedCardIndex = 0);

                      Navigator.of(context).pushNamed(
                        Routes.todaySalesScreen,
                      );
                    },
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: StatCard(
                    title: l10n.expenses.toUpperCase(),
                    value: '${summary.todayExpenses}',
                    unit: 'EGP',
                    change: '${summary.expensesChangePct}%',
                    icon: Icons.receipt_long_outlined,
                    isNegative:
                        summary.expensesChangePct < 0,
                    isSelected: selectedCardIndex == 1,
                    onTap: () {
                      setState(() => selectedCardIndex = 1);
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                Expanded(
                  child: StatCard(
                    title: l10n.purchases.toUpperCase(),
                    value: '${summary.todayPurchases}',
                    unit: 'EGP',
                    change: '${summary.purchasesChangePct}%',
                    icon: Icons.shopping_cart_outlined,
                    isNegative:
                        summary.purchasesChangePct < 0,
                    isSelected: selectedCardIndex == 2,
                    onTap: () {
                      setState(() => selectedCardIndex = 2);

                      Navigator.of(context).pushNamed(
                        Routes.purchasesScreen,
                      );
                    },
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: StatCard(
                    title: l10n.netProfit.toUpperCase(),
                    value: '${summary.netProfit}',
                    unit: 'EGP',
                    change: '${summary.netProfitChangePct}%',
                    icon: Icons.attach_money_rounded,
                    accentColor: const Color(0xFF059669),
                    isSelected: selectedCardIndex == 3,
                    onTap: () {
                      setState(() => selectedCardIndex = 3);

                      Navigator.of(context).pushNamed(
                        Routes.profitDetailsScreen,
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}