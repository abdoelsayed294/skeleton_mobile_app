import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/helpers/shared_pref_helper.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/purchases/domain/use_cases/get_purchases_recent_use_case.dart';
import 'package:skeleton_mobile_app/features/purchases/logic/purchases_recent_state.dart';

@injectable
class PurchasesRecentCubit extends Cubit<PurchasesRecentState> {
  final GetPurchasesRecentUseCase _getPurchasesRecentUseCase;

  PurchasesRecentCubit(this._getPurchasesRecentUseCase)
    : super(const PurchasesRecentState.initial());

  static const int _pageSize = 20;
  int _year = DateTime.now().year;
  int _month = DateTime.now().month;
  int _take = _pageSize;
  int _requestId = 0;
  int _queryVersion = 0;
  bool _hasMore = true;
  bool _isLoadingMore = false;
  Future<void>? _loadMoreFuture;

  bool get hasMore => _hasMore;
  bool get isLoadingMore => _isLoadingMore;

  Future<void> getPurchasesRecent(int year, int month, {int take = 20}) async {
    final queryVersion = ++_queryVersion;
    final requestId = ++_requestId;
    _year = year;
    _month = month;
    _take = take;
    _hasMore = true;
    _isLoadingMore = false;
    emit(const PurchasesRecentState.loading());
    final storeId = await SharedPrefHelper.getInt(SharedPrefHelper.storeIdKey);
    final result = await _getPurchasesRecentUseCase.invoke(
      storeId,
      year,
      month,
      take,
    );
    if (requestId != _requestId) return;
    result.when(
      success: (data) {
        _hasMore = data.items.length < data.count || data.items.length >= take;
        emit(PurchasesRecentState.success(data));
      },
      failure: (error) {
        _hasMore = false;
        emit(PurchasesRecentState.error(error));
      },
    );
    while (queryVersion == _queryVersion && _hasMore && !isClosed) {
      await loadMore();
    }
  }

  Future<void> loadMore() {
    final pendingRequest = _loadMoreFuture;
    if (pendingRequest != null) return pendingRequest;
    if (!_hasMore || isClosed) return Future<void>.value();

    final request = _fetchMore();
    _loadMoreFuture = request;
    return request.whenComplete(() {
      if (identical(_loadMoreFuture, request)) _loadMoreFuture = null;
    });
  }

  Future<void> _fetchMore() async {
    final currentData = state.maybeWhen(
      success: (data) => data,
      loadingMore: (data) => data,
      orElse: () => null,
    );
    if (currentData == null) return;

    final requestId = ++_requestId;
    _isLoadingMore = true;
    _take += _pageSize;
    emit(PurchasesRecentState.loadingMore(currentData));

    final storeId = await SharedPrefHelper.getInt(SharedPrefHelper.storeIdKey);
    final result = await _getPurchasesRecentUseCase.invoke(
      storeId,
      _year,
      _month,
      _take,
    );
    if (requestId != _requestId) return;
    _isLoadingMore = false;

    result.when(
      success: (data) {
        _hasMore = data.items.length < data.count || data.items.length >= _take;
        emit(PurchasesRecentState.success(data));
      },
      failure: (_) {
        _hasMore = false;
        emit(PurchasesRecentState.success(currentData));
      },
    );
  }
}
