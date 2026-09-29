import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton/core/theming/app_color.dart';
import 'package:skeleton/core/widgets/dilaog_utils.dart';
import 'package:skeleton/features/expeness/logic/expenses_summary_cubit.dart';
import 'package:skeleton/features/expeness/logic/expenses_summary_state.dart';
import 'package:skeleton/features/expeness/ui/widgets/expense_stat_mini_card.dart';
import 'package:skeleton/features/expeness/ui/widgets/expenses_summary_shimmer.dart';
import 'package:skeleton/features/expeness/ui/widgets/total_expenses_summary_card.dart';
import 'package:skeleton/l10n/app_localizations.dart';

class ExpensesSummarySection extends StatelessWidget {
  const ExpensesSummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BlocConsumer<ExpensesSummaryCubit, ExpensesSummaryState>(
      listener: (context, state) {
        state.maybeWhen(
          error: (error) => DialogUtils.showMessage(
            context: context,
            type: DialogType.error,
            title: l10n.errorTitle,
            message: error.error?.message ?? l10n.genericError,
          ),
          orElse: () {},
        );
      },
      builder: (context, state) => state.maybeWhen(
        loading: () => const ExpensesSummaryShimmer(),
        success: (data) {
          final dark = Theme.of(context).brightness == Brightness.dark;
          final error = dark ? AppColorsDark.error : AppColorsLight.error;
          final success = dark ? AppColorsDark.success : AppColorsLight.success;
          return Column(
            children: [
              TotalExpensesSummaryCard(
                periodLabel: data.periodLabel ?? data.period ?? l10n.month,
                totalAmount: data.totalExpenses,
                changePercent: data.pct,
                previousAmount: data.vsTotal,
                transactionsCount: data.transactions,
                avgPerTransaction: data.avgPerTx,
                dailyAverage: data.dailyAvg,
              ),
              SizedBox(height: 12.h),
              Row(
                children: [
                  ExpenseStatMiniCard(
                    icon: Icons.arrow_upward_rounded,
                    iconBg: dark
                        ? AppColorsDark.errorBg
                        : AppColorsLight.errorBg,
                    valueColor: error,
                    amount: data.highest?.value ?? 0,
                    label: l10n.highestSingle,
                    subtitle:
                        data.highest?.type ?? data.highest?.dayFormatted ?? '',
                  ),
                  SizedBox(width: 12.w),
                  ExpenseStatMiniCard(
                    icon: Icons.arrow_downward_rounded,
                    iconBg: dark
                        ? AppColorsDark.successBg
                        : AppColorsLight.successBg,
                    valueColor: success,
                    amount: data.lowest?.value ?? 0,
                    label: l10n.lowestSingle,
                    subtitle:
                        data.lowest?.type ?? data.lowest?.dayFormatted ?? '',
                  ),
                ],
              ),
            ],
          );
        },
        orElse: () => const ExpensesSummaryShimmer(),
      ),
    );
  }
}
