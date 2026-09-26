import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/today_sales/domain/use_cases/get_today_sales_use_case.dart';
import 'package:skeleton_mobile_app/features/today_sales/logic/today_sales_state.dart';

@injectable
class TodaySalesCubit extends Cubit<TodaySalesState> {
  final GetTodaySalesUseCase _getTodaySalesUseCase;

  TodaySalesCubit(this._getTodaySalesUseCase)
    : super(const TodaySalesState.initial());

  Future<void> getTodaySales({
    required int storeId,
    required DateTime date,
  }) async {
    emit(const TodaySalesState.loading());
    final result = await _getTodaySalesUseCase.getTodaySales(storeId, date);
    result.when(
      success: (data) => emit(TodaySalesState.success(data)),
      failure: (error) => emit(TodaySalesState.error(error)),
    );
  }
}
