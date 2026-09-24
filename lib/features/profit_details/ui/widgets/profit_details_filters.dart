import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/features/profit_details/logic/profit_summary_cubit.dart';
import 'package:skeleton_mobile_app/features/profit_details/logic/profit_summary_state.dart';
import 'package:skeleton_mobile_app/features/profit_details/logic/profit_weekly_chart_cubit.dart';
import 'package:skeleton_mobile_app/features/profit_details/ui/widgets/profit_details_header.dart';
import 'package:skeleton_mobile_app/features/profit_details/ui/widgets/profit_period_chip.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class ProfitDetailsFilters extends StatelessWidget {
  const ProfitDetailsFilters({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocConsumer<ProfitSummaryCubit, ProfitSummaryState>(
        listener: (context, state) {},
        builder: (context, state) {
          final theme = Theme.of(context);
          final l10n = AppLocalizations.of(context)!;
          final cubit = context.read<ProfitSummaryCubit>();
          final weeklyCubit = context.read<ProfitWeeklyChartCubit>();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfitDetailsHeader(
                title: l10n.profitDetails,
                selectedDate: cubit.selectedDate,
                onDateChanged: (date) {
                  cubit.selectDate(date);
                  weeklyCubit.getProfitWeeklyChart();
                },
                onBack: () => Navigator.of(context).pop(),
              ),
              SizedBox(height: 12.h),
              Container(
                padding: EdgeInsets.all(3.w),
                decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: theme.dividerColor),
                ),
                child: Row(
                  children: [
                    ProfitPeriodChip(
                      label: l10n.today,
                      selected: cubit.selectedPeriod == 'today',
                      onTap: () {
                        cubit.getProfitSummary('today');
                        weeklyCubit.getProfitWeeklyChart();
                      },
                    ),
                    ProfitPeriodChip(
                      label: l10n.week,
                      selected: cubit.selectedPeriod == 'week',
                      onTap: () {
                        cubit.getProfitSummary('week');
                        weeklyCubit.getProfitWeeklyChart();
                      },
                    ),
                    ProfitPeriodChip(
                      label: l10n.month,
                      selected: cubit.selectedPeriod == 'month',
                      onTap: () {
                        cubit.getProfitSummary('month');
                        weeklyCubit.getProfitWeeklyChart();
                      },
                    ),
                    ProfitPeriodChip(
                      label: l10n.year,
                      selected: cubit.selectedPeriod == 'year',
                      onTap: () {
                        cubit.getProfitSummary('year');
                        weeklyCubit.getProfitWeeklyChart();
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      );
}
