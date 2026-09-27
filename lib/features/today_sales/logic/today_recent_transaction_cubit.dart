import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/helpers/shared_pref_helper.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/today_sales/domain/use_cases/get_today_recent_transaction_use_case.dart';
import 'package:skeleton_mobile_app/features/today_sales/logic/today_recent_transaction_state.dart';

@injectable
class TodayRecentTransactionCubit extends Cubit<TodayRecentTransactionState> {
  final GetTodayRecentTransactionUseCase _getTodayRecentTransactionUseCase;
  int _requestId = 0;

  TodayRecentTransactionCubit(this._getTodayRecentTransactionUseCase)
    : super(const TodayRecentTransactionState.initial());

  Future<void> getRecentTransactions({
    required DateTime date,
    required int take,
    required bool all,
  }) async {
    final requestId = ++_requestId;
    emit(const TodayRecentTransactionState.loading());
    final storeId = await SharedPrefHelper.getInt(SharedPrefHelper.storeIdKey);
    if (isClosed) return;
    final result = await _getTodayRecentTransactionUseCase
        .getRecentTransactions(storeId, date, take, all);
    if (requestId != _requestId || isClosed) return;
    result.when(
      success: (data) => emit(TodayRecentTransactionState.success(data)),
      failure: (error) => emit(TodayRecentTransactionState.error(error)),
    );
  }
}
