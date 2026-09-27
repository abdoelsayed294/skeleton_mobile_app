import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/features/expeness/logic/expenses_date_cubit.dart';
import 'package:skeleton_mobile_app/features/expeness/logic/expenses_date_state.dart';
import 'package:skeleton_mobile_app/features/expeness/ui/widgets/expense_speriod_selector.dart';
import 'package:skeleton_mobile_app/features/expeness/ui/widgets/expenses_categories_section.dart';
import 'package:skeleton_mobile_app/features/expeness/ui/widgets/expenses_peak_days_section.dart';
import 'package:skeleton_mobile_app/features/expeness/ui/widgets/expenses_summary_section.dart';
import 'package:skeleton_mobile_app/features/expeness/ui/widgets/expenses_transactions_section.dart';
import 'package:skeleton_mobile_app/features/expeness/ui/widgets/expenses_trend_section.dart';
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
      appBar: AppBar(
        backgroundColor: background,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: Text(
          l10n.expenses,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 17.sp,
            fontWeight: FontWeight.w700,
            color: dark
                ? AppColorsDark.textPrimary
                : AppColorsLight.textPrimary,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12.h),
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
    );
  }
}
