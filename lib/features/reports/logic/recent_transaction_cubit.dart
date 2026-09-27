import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/helpers/shared_pref_helper.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/reports/domain/use_cases/recent_transaction_use_case.dart';
import 'package:skeleton_mobile_app/features/reports/logic/recent_transaction_state.dart';

@injectable
class RecentTransactionCubit extends Cubit<RecentTransactionState> {
  final RecentTransactionUseCase recentTransactionUseCase;
  int _requestId = 0;
  int _take = 10;
  int _year = DateTime.now().year;
  int _month = DateTime.now().month;
  int _loadedCount = 0;
  bool _hasMore = true;
  bool _isLoadingMore = false;

  bool get hasMore => _hasMore;
  bool get isLoadingMore => _isLoadingMore;

  RecentTransactionCubit(this.recentTransactionUseCase)
    : super(const RecentTransactionState.initial());

  Future<void> getRecentTransactions({
    required int take,
    required int year,
    required int month,
  }) async {
    final requestId = ++_requestId;
    _take = take;
    _year = year;
    _month = month;
    _loadedCount = 0;
    _hasMore = true;
    _isLoadingMore = false;
    emit(const RecentTransactionState.loading());
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
    emit(RecentTransactionState.success(current));
    await _fetch(++_requestId);
  }

  Future<void> _fetch(int requestId) async {
    final storeId = await SharedPrefHelper.getInt(SharedPrefHelper.storeIdKey);
    if (isClosed) return;
    final result = await recentTransactionUseCase.getRecentTransactions(
      storeId,
      _take,
      _year,
      _month,
    );
    if (requestId != _requestId || isClosed) return;
    _isLoadingMore = false;
    result.when(
      success: (data) {
        _hasMore = data.length > _loadedCount && data.length >= _take;
        _loadedCount = data.length;
        emit(RecentTransactionState.success(data));
      },
      failure: (error) => emit(RecentTransactionState.error(error)),
    );
  }
}
