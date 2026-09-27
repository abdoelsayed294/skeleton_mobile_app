import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/helpers/shared_pref_helper.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/expeness/domain/entity/expenses_transactions.dart';
import 'package:skeleton_mobile_app/features/expeness/domain/use_case/get_expenses_transactions_use_case.dart';
import 'package:skeleton_mobile_app/features/expeness/logic/expenses_transactions_state.dart';

@injectable
class ExpensesTransactionsCubit extends Cubit<ExpensesTransactionsState> {
  ExpensesTransactionsCubit(this._useCase)
    : super(const ExpensesTransactionsState.initial());
  final GetExpensesTransactionsUseCase _useCase;
  String _sort = 'latest';
  int _take = 50;
  int _skip = 0;
  bool _hasMore = true;
  bool _isLoadingMore = false;
  String get currentSort => _sort;
  bool get hasMore => _hasMore;
  bool get isLoadingMore => _isLoadingMore;

  Future<void> getExpensesTransactions({
    String sort = 'latest',
    int take = 50,
    int skip = 0,
  }) async {
    _sort = sort;
    _take = take;
    _skip = skip;
    _hasMore = true;
    _isLoadingMore = false;
    emit(const ExpensesTransactionsState.loading());
    final storeId = await SharedPrefHelper.getInt(SharedPrefHelper.storeIdKey);
    final result = await _useCase.invoke(
      storeId,
      sort: sort,
      take: take,
      skip: skip,
    );
    result.when(
      success: (data) {
        _hasMore = _skip + data.items.length < data.totalCount;
        emit(ExpensesTransactionsState.success(data));
      },
      failure: (error) => emit(ExpensesTransactionsState.error(error)),
    );
  }

  Future<void> changeSort(String sort) =>
      getExpensesTransactions(sort: sort, take: _take, skip: 0);

  Future<void> loadNextPage() async {
    if (_isLoadingMore || !_hasMore) return;
    final current = state.maybeWhen(
      success: (data) => data,
      orElse: () => null,
    );
    if (current == null) return;
    _isLoadingMore = true;
    emit(
      ExpensesTransactionsState.success(
        ExpensesTransactions(
          storeId: current.storeId,
          sort: current.sort,
          currency: current.currency,
          totalCount: current.totalCount,
          count: current.count,
          items: current.items,
          isLoadingMore: true,
        ),
      ),
    );
    final nextSkip = _skip + _take;
    final storeId = await SharedPrefHelper.getInt(SharedPrefHelper.storeIdKey);
    final result = await _useCase.invoke(
      storeId,
      sort: _sort,
      take: _take,
      skip: nextSkip,
    );
    _isLoadingMore = false;
    result.when(
      success: (page) {
        _skip = nextSkip;
        final allItems = [...current.items, ...page.items];
        _hasMore = allItems.length < page.totalCount;
        emit(
          ExpensesTransactionsState.success(
            ExpensesTransactions(
              storeId: page.storeId,
              sort: page.sort,
              currency: page.currency,
              totalCount: page.totalCount,
              count: allItems.length,
              items: allItems,
              isLoadingMore: false,
            ),
          ),
        );
      },
      failure: (error) => emit(ExpensesTransactionsState.error(error)),
    );
  }
}
