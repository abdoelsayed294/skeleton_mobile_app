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
  ) : super(initialDate) {
    _loadDate(state);
  }

  void selectDate(DateTime date) {
    emit(date);
    _loadDate(date);
  }

  Future<void> refresh() => _loadDate(state);

  Future<void> _loadDate(DateTime date) => Future.wait<void>([
    _summaryCubit.getPurchasesSummary(date),
    _recentCubit.getPurchasesRecent(date),
  ]);
}
