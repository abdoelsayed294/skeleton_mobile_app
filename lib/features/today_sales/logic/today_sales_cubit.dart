import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/helpers/shared_pref_helper.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/today_sales/domain/use_cases/get_today_sales_use_case.dart';
import 'package:skeleton_mobile_app/features/today_sales/logic/today_sales_state.dart';

@injectable
class TodaySalesCubit extends Cubit<TodaySalesState> {
  final GetTodaySalesUseCase _getTodaySalesUseCase;
  int _requestId = 0;

  TodaySalesCubit(this._getTodaySalesUseCase)
    : super(const TodaySalesState.initial());

  Future<void> getTodaySales({required DateTime date}) async {
    final requestId = ++_requestId;
    emit(const TodaySalesState.loading());
    final storeId = await SharedPrefHelper.getInt(SharedPrefHelper.storeIdKey);
    if (isClosed) return;
    final result = await _getTodaySalesUseCase.getTodaySales(storeId, date);
    if (requestId != _requestId || isClosed) return;
    result.when(
      success: (data) => emit(TodaySalesState.success(data)),
      failure: (error) => emit(TodaySalesState.error(error)),
    );
  }
}
