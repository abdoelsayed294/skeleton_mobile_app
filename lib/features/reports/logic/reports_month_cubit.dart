import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeleton/features/reports/logic/recent_transaction_cubit.dart';
import 'package:skeleton/features/reports/logic/reports_sales_cubit.dart';
import 'package:skeleton/features/reports/logic/top_selling_cubit.dart';

class ReportsMonthCubit extends Cubit<DateTime> {
  final ReportsSalesCubit _reportsSalesCubit;
  final TopSellingCubit _topSellingCubit;
  final RecentTransactionCubit _recentTransactionCubit;

  ReportsMonthCubit(
    this._reportsSalesCubit,
    this._topSellingCubit,
    this._recentTransactionCubit,
    DateTime initialMonth,
  ) : super(DateTime(initialMonth.year, initialMonth.month)) {
    _loadMonth(state);
  }

  void previousMonth() {
    _selectMonth(DateTime(state.year, state.month - 1));
  }

  void nextMonth() {
    _selectMonth(DateTime(state.year, state.month + 1));
  }

  void _selectMonth(DateTime month) {
    final selectedMonth = DateTime(month.year, month.month);
    emit(selectedMonth);
    _loadMonth(selectedMonth);
  }

  Future<void> refresh() => _loadMonth(state);

  Future<void> _loadMonth(DateTime month) => Future.wait<void>([
    _reportsSalesCubit.getReportsSales(
      period: 'month',
      year: month.year,
      month: month.month,
    ),
    _topSellingCubit.getTopSelling(
      period: 'month',
      take: 5,
      year: month.year,
      month: month.month,
    ),
    _recentTransactionCubit.getRecentTransactions(
      take: 10,
      year: month.year,
      month: month.month,
    ),
  ]);
}
