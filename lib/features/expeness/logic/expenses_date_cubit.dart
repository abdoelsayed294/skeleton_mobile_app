import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeleton/features/expeness/logic/expenses_by_category_cubit.dart';
import 'package:skeleton/features/expeness/logic/expenses_date_state.dart';
import 'package:skeleton/features/expeness/logic/expenses_monthly_trend_cubit.dart';
import 'package:skeleton/features/expeness/logic/expenses_peak_days_cubit.dart';
import 'package:skeleton/features/expeness/logic/expenses_summary_cubit.dart';
import 'package:skeleton/features/expeness/logic/expenses_transactions_cubit.dart';
import 'package:skeleton/features/expeness/ui/widgets/expense_speriod_selector.dart';

class ExpensesDateCubit extends Cubit<ExpensesDateState> {
  ExpensesDateCubit(
    this._summaryCubit,
    this._trendCubit,
    this._categoryCubit,
    this._peakDaysCubit,
    this._transactionsCubit, {
    required DateTime initialDate,
  }) : super(
         ExpensesDateState(
           selectedPeriod: ExpensesPeriod.month,
           selectedDate: initialDate,
         ),
       );

  final ExpensesSummaryCubit _summaryCubit;
  final ExpensesMonthlyTrendCubit _trendCubit;
  final ExpensesByCategoryCubit _categoryCubit;
  final ExpensesPeakDaysCubit _peakDaysCubit;
  final ExpensesTransactionsCubit _transactionsCubit;

  Future<void> loadInitial() => _load(state);

  Future<void> selectPeriod(ExpensesPeriod period) async {
    final next = ExpensesDateState(
      selectedPeriod: period,
      selectedDate: state.selectedDate,
    );
    emit(next);
    await _load(next);
  }

  Future<void> selectDate(DateTime date) async {
    final next = ExpensesDateState(
      selectedPeriod: state.selectedPeriod,
      selectedDate: date,
    );
    emit(next);
    await _load(next);
  }

  Future<void> _load(ExpensesDateState value) async {
    final period = switch (value.selectedPeriod) {
      ExpensesPeriod.day => 'today',
      ExpensesPeriod.week => 'week',
      ExpensesPeriod.month => 'month',
      ExpensesPeriod.quarter => 'quarter',
      ExpensesPeriod.year => 'year',
    };
    await Future.wait([
      _summaryCubit.getExpensesSummary(
        period: period,
        date: value.selectedDate,
      ),
      _trendCubit.getExpensesMonthlyTrend(value.selectedDate),
      _categoryCubit.getExpensesByCategory(
        period: period,
        date: value.selectedDate,
      ),
      _peakDaysCubit.getExpensesPeakDays(take: 5),
      _transactionsCubit.getExpensesTransactions(
        date: value.selectedDate,
        period: period,
      ),
    ]);
  }
}
