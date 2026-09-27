import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/features/expeness/logic/expenses_date_cubit.dart';
import 'package:skeleton_mobile_app/features/expeness/logic/expenses_date_state.dart';
import 'package:skeleton_mobile_app/features/expeness/ui/widgets/expense_speriod_selector.dart';
import 'package:skeleton_mobile_app/features/expeness/ui/widgets/expenses_categories_section.dart';
import 'package:skeleton_mobile_app/features/expeness/ui/widgets/expenses_peak_days_section.dart';
import 'package:skeleton_mobile_app/features/expeness/ui/widgets/expenses_summary_section.dart';
import 'package:skeleton_mobile_app/features/expeness/ui/widgets/expenses_transactions_section.dart';
import 'package:skeleton_mobile_app/features/expeness/ui/widgets/expenses_trend_section.dart';
import 'package:skeleton_mobile_app/features/profit_details/ui/widgets/profit_details_header.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class ExpensesScreen extends StatelessWidget {
  const ExpensesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;
    final background = dark
        ? AppColorsDark.background
        : AppColorsLight.background;
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: context.read<ExpensesDateCubit>().loadInitial,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 18.h),
                ProfitDetailsHeader(
                  title: l10n.expenses,
                  onBack: () => Navigator.of(context).maybePop(),
                  showDateSelector: false,
                ),
                SizedBox(height: 16.h),
                BlocBuilder<ExpensesDateCubit, ExpensesDateState>(
                  builder: (context, state) => SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: ExpensesPeriodSelector(
                      selected: state.selectedPeriod,
                      onChanged: context.read<ExpensesDateCubit>().selectPeriod,
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                const ExpensesSummarySection(),
                SizedBox(height: 16.h),
                const ExpensesTrendSection(),
                SizedBox(height: 16.h),
                const ExpensesCategoriesSection(),
                SizedBox(height: 16.h),
                const ExpensesPeakDaysSection(),
                SizedBox(height: 16.h),
                const ExpensesTransactionsSection(),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
