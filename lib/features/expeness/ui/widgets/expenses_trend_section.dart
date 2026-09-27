import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeleton_mobile_app/core/widgets/dilaog_utils.dart';
import 'package:skeleton_mobile_app/features/expeness/logic/expenses_monthly_trend_cubit.dart';
import 'package:skeleton_mobile_app/features/expeness/logic/expenses_monthly_trend_state.dart';
import 'package:skeleton_mobile_app/features/expeness/ui/widgets/expenses_trend_shimmer.dart';
import 'package:skeleton_mobile_app/features/expeness/ui/widgets/monthly_trend_chart_card.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class ExpensesTrendSection extends StatelessWidget {
  const ExpensesTrendSection({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BlocConsumer<ExpensesMonthlyTrendCubit, ExpensesMonthlyTrendState>(
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
        loading: () => const ExpensesTrendShimmer(),
        success: (data) => MonthlyTrendChartCard(
          year: '${data.year ?? DateTime.now().year}',
          months: data.chart.map((item) => item.label ?? '').toList(),
          values: data.chart.map((item) => item.total).toList(),
          lastValueLabel: data.total.toStringAsFixed(0),
        ),
        orElse: () => const ExpensesTrendShimmer(),
      ),
    );
  }
}
