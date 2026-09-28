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
  String? _period = 'month';
  int _take = 50;
  DateTime _date = DateTime.now();
  bool _hasMore = true;
  bool _isLoadingMore = false;
  String get currentSort => _sort;
  bool get hasMore => _hasMore;
  bool get isLoadingMore => _isLoadingMore;

  Future<void> getExpensesTransactions({
    String sort = 'latest',
    int take = 50,
    required DateTime date,
    String? period = 'month',
  }) async {
    _sort = sort;
    _take = take;
    _date = date;
    _period = period;
    _hasMore = true;
    _isLoadingMore = false;
    emit(const ExpensesTransactionsState.loading());
    final storeId = await SharedPrefHelper.getInt(SharedPrefHelper.storeIdKey);
    final result = await _useCase.invoke(
      storeId,
      sort: sort,
      take: take,
      date: _formatDate(_date),
      period: _period,
    );
    result.when(
      success: (data) {
        _hasMore = data.items.length < data.totalCount;
        emit(ExpensesTransactionsState.success(data));
      },
      failure: (error) => emit(ExpensesTransactionsState.error(error)),
    );
  }

  Future<void> changeSort(String sort) => getExpensesTransactions(
    sort: sort,
    take: 50,
    date: _date,
    period: _period,
  );

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
          date: current.date,
          period: current.period,
          range: current.range,
          currency: current.currency,
          totalCount: current.totalCount,
          count: current.count,
          items: current.items,
          isLoadingMore: true,
        ),
      ),
    );
    final nextTake = _take + 50;
    final storeId = await SharedPrefHelper.getInt(SharedPrefHelper.storeIdKey);
    final result = await _useCase.invoke(
      storeId,
      sort: _sort,
      take: nextTake,
      date: _formatDate(_date),
      period: _period,
    );
    _isLoadingMore = false;
    result.when(
      success: (page) {
        _take = nextTake;
        _hasMore = page.items.length < page.totalCount;
        emit(
          ExpensesTransactionsState.success(
            ExpensesTransactions(
              storeId: page.storeId,
              sort: page.sort,
              date: page.date,
              period: page.period,
              range: page.range,
              currency: page.currency,
              totalCount: page.totalCount,
              count: page.count,
              items: page.items,
              isLoadingMore: false,
            ),
          ),
        );
      },
      failure: (error) => emit(ExpensesTransactionsState.error(error)),
    );
  }

  String _formatDate(DateTime date) => date.toIso8601String().split('T').first;
}
