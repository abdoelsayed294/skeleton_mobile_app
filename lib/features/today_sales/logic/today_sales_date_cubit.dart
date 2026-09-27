import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeleton_mobile_app/features/today_sales/logic/today_recent_transaction_cubit.dart';
import 'package:skeleton_mobile_app/features/today_sales/logic/today_sales_cubit.dart';

class TodaySalesDateCubit extends Cubit<DateTime> {
  final TodaySalesCubit _salesCubit;
  final TodayRecentTransactionCubit _recentTransactionsCubit;

  TodaySalesDateCubit(
    this._salesCubit,
    this._recentTransactionsCubit,
    DateTime initialDate,
  ) : super(initialDate) {
    _loadDate(state);
  }

  void selectDate(DateTime date) {
    emit(date);
    _loadDate(date);
  }

  Future<void> refresh() => _loadDate(state);

  Future<void> _loadDate(DateTime date) => Future.wait<void>([
    _salesCubit.getTodaySales(date: date),
    _recentTransactionsCubit.getRecentTransactions(
      date: date,
      take: 10,
      all: false,
    ),
  ]);
}
