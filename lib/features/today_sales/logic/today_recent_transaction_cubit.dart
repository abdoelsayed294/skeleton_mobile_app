import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/today_sales/domain/use_cases/get_today_recent_transaction_use_case.dart';
import 'package:skeleton_mobile_app/features/today_sales/logic/today_recent_transaction_state.dart';

@injectable
class TodayRecentTransactionCubit extends Cubit<TodayRecentTransactionState> {
  final GetTodayRecentTransactionUseCase _getTodayRecentTransactionUseCase;

  TodayRecentTransactionCubit(this._getTodayRecentTransactionUseCase) : super(const TodayRecentTransactionState.initial());

  Future<void> getRecentTransactions({
    required int storeId,
    required String period,
    required int take,
  }) async {
    emit(const TodayRecentTransactionState.loading());
    final result = await _getTodayRecentTransactionUseCase.getRecentTransactions(storeId, period, take);
    result.when(
      success: (data) => emit(TodayRecentTransactionState.success(data)),
      failure: (error) => emit(TodayRecentTransactionState.error(error)),
    );
  }
}
