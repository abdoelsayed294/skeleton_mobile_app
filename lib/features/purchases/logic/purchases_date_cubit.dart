import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeleton_mobile_app/features/purchases/logic/purchases_recent_cubit.dart';
import 'package:skeleton_mobile_app/features/purchases/logic/purchases_summary_cubit.dart';

class PurchasesDateCubit extends Cubit<DateTime> {
  final PurchasesSummaryCubit _summaryCubit;
  final PurchasesRecentCubit _recentCubit;

  PurchasesDateCubit(
    this._summaryCubit,
    this._recentCubit,
    DateTime initialDate,
  ) : super(DateTime(initialDate.year, initialDate.month)) {
    _loadDate(state);
  }

  void selectDate(DateTime date) {
    final selectedDate = DateTime(date.year, date.month, date.day);
    emit(selectedDate);
    _loadDate(selectedDate);
  }

  void _loadDate(DateTime date) {
    _summaryCubit.selectDate(date);
    _recentCubit.getPurchasesRecent(date.year, date.month);
  }
}
