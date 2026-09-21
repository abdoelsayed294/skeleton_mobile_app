import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/routing/routes.dart';
import 'package:skeleton_mobile_app/core/widgets/dilaog_utils.dart';
import 'package:skeleton_mobile_app/features/home/domain/entities/summary_response.dart';
import 'package:skeleton_mobile_app/features/home/logic/home_cubit.dart';
import 'package:skeleton_mobile_app/features/home/logic/home_state.dart';
import 'package:skeleton_mobile_app/features/home/ui/widgets/statCard.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class StatsGrid extends StatefulWidget {
  const StatsGrid({super.key});

  @override
  State<StatsGrid> createState() => _StatsGridState();
}

class _StatsGridState extends State<StatsGrid> {
  int selectedCardIndex = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocConsumer<HomeCubit, HomeState>(
      listenWhen: (previous, current) =>
          current is Error && previous is! Error,
      listener: (context, state) {
        state.whenOrNull(
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
        if (state is Loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final summary = state.maybeWhen(
          success: (data) =>
              data is SummaryResponse ? data : null,
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
                    value: '${summary.todaySales ?? 0}',
                    unit: 'EGP',
                    change: '${summary.salesChangePct ?? 0}%',
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
                    title: l10n.todayOrders.toUpperCase(),
                    value: '0',
                    unit: l10n.orders,
                    change: '0%',
                    icon: Icons.shopping_bag_outlined,
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
                    value: '${summary.todayPurchases ?? 0}',
                    unit: 'EGP',
                    change: '${summary.purchasesChangePct ?? 0}%',
                    icon: Icons.shopping_bag_outlined,
                    isNegative:
                        (summary.purchasesChangePct ?? 0) < 0,
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
                    value: '${summary.netProfit ?? 0}',
                    unit: 'EGP',
                    change: '${summary.netProfitChangePct ?? 0}%',
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

