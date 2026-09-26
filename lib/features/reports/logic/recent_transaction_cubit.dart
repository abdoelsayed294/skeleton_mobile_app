import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/reports/domain/use_cases/recent_transaction_use_case.dart';
import 'package:skeleton_mobile_app/features/reports/logic/recent_transaction_state.dart';

@injectable
class RecentTransactionCubit extends Cubit<RecentTransactionState> {
  final RecentTransactionUseCase recentTransactionUseCase;
  int _requestId = 0;

  RecentTransactionCubit(this.recentTransactionUseCase)
    : super(const RecentTransactionState.initial());

  Future<void> getRecentTransactions({
    required int storeId,
    required int take,
    required int year,
    required int month,
  }) async {
    final requestId = ++_requestId;
    emit(const RecentTransactionState.loading());
    final result = await recentTransactionUseCase.getRecentTransactions(
      storeId,
      take,
      year,
      month,
    );
    if (requestId != _requestId || isClosed) return;
    result.when(
      success: (data) => emit(RecentTransactionState.success(data)),
      failure: (error) => emit(RecentTransactionState.error(error)),
    );
  }
}
