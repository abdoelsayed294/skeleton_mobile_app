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
  DateTime _date = DateTime.now();
  int _take = 10;
  bool _all = false;
  int _loadedCount = 0;
  bool _hasMore = true;
  bool _isLoadingMore = false;

  bool get hasMore => _hasMore;
  bool get isLoadingMore => _isLoadingMore;

  TodayRecentTransactionCubit(this._getTodayRecentTransactionUseCase)
    : super(const TodayRecentTransactionState.initial());

  Future<void> getRecentTransactions({
    required DateTime date,
    required int take,
    required bool all,
  }) async {
    final requestId = ++_requestId;
    _date = date;
    _take = take;
    _all = all;
    _loadedCount = 0;
    _hasMore = true;
    _isLoadingMore = false;
    emit(const TodayRecentTransactionState.loading());
    await _fetch(requestId);
  }

  Future<void> loadMore() async {
    if (!_hasMore || _isLoadingMore || isClosed) return;
    final current = state.maybeWhen(
      success: (data) => data,
      orElse: () => null,
    );
    if (current == null) return;

    _isLoadingMore = true;
    _take += 20;
    emit(TodayRecentTransactionState.success(current));
    await _fetch(++_requestId);
  }

  Future<void> _fetch(int requestId) async {
    final storeId = await SharedPrefHelper.getInt(SharedPrefHelper.storeIdKey);
    if (isClosed) return;
    final result = await _getTodayRecentTransactionUseCase
        .getRecentTransactions(storeId, _date, _take, _all);
    if (requestId != _requestId || isClosed) return;
    _isLoadingMore = false;
    result.when(
      success: (data) {
        _hasMore = data.length > _loadedCount && data.length >= _take;
        _loadedCount = data.length;
        emit(TodayRecentTransactionState.success(data));
      },
      failure: (error) => emit(TodayRecentTransactionState.error(error)),
    );
  }
}
