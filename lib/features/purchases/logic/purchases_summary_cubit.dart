import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/helpers/shared_pref_helper.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/purchases/domain/use_cases/get_purchases_summary_use_case.dart';
import 'package:skeleton_mobile_app/features/purchases/logic/purchases_summary_state.dart';

@injectable
class PurchasesSummaryCubit extends Cubit<PurchasesSummaryState> {
  final GetPurchasesSummaryUseCase _getPurchasesSummaryUseCase;

  PurchasesSummaryCubit(this._getPurchasesSummaryUseCase)
    : super(const PurchasesSummaryState.initial());

  DateTime selectedDate = DateTime.now();
  int _requestId = 0;

  void selectDate(DateTime date) {
    selectedDate = date;
    getPurchasesSummary(date);
  }

  Future<void> getPurchasesSummary(DateTime date) async {
    selectedDate = date;
    final requestId = ++_requestId;
    emit(const PurchasesSummaryState.loading());
    final storeId = await SharedPrefHelper.getInt(SharedPrefHelper.storeIdKey);
    if (isClosed || requestId != _requestId) return;
    final dateParam = date.toIso8601String().split('T').first;
    final result = await _getPurchasesSummaryUseCase.invoke(storeId, dateParam);
    if (isClosed || requestId != _requestId) return;
    result.when(
      success: (data) => emit(PurchasesSummaryState.success(data)),
      failure: (error) => emit(PurchasesSummaryState.error(error)),
    );
  }
}
