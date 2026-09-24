import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/reports/domain/use_cases/top_selling_use_case.dart';
import 'package:skeleton_mobile_app/features/reports/logic/top_selling_state.dart';

@injectable
class TopSellingCubit extends Cubit<TopSellingState> {
  final TopSellingUseCase topSellingUseCase;
  int _requestId = 0;

  TopSellingCubit(this.topSellingUseCase)
    : super(const TopSellingState.initial());

  Future<void> getTopSelling({
    required int storeId,
    required String period,
    required int take,
    required int year,
    required int month,
  }) async {
    final requestId = ++_requestId;
    emit(const TopSellingState.loading());
    final result = await topSellingUseCase.getTopSelling(
      storeId,
      period,
      take,
      year,
      month,
    );
    if (requestId != _requestId || isClosed) return;
    result.when(
      success: (data) => emit(TopSellingState.success(data)),
      failure: (error) => emit(TopSellingState.error(error)),
    );
  }
}
