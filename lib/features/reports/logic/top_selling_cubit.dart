import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/reports/domain/use_cases/top_selling_use_case.dart';
import 'package:skeleton_mobile_app/features/reports/logic/top_selling_state.dart';

@injectable
class TopSellingCubit extends Cubit<TopSellingState> {
  final TopSellingUseCase topSellingUseCase;

  TopSellingCubit(this.topSellingUseCase)
    : super(const TopSellingState.initial());

  Future<void> getTopSelling({
    required int storeId,
    required String period,
    required int take,
  }) async {
    emit(const TopSellingState.loading());
    final result = await topSellingUseCase.getTopSelling(storeId, period, take);
    result.when(
      success: (data) => emit(TopSellingState.success(data)),
      failure: (error) => emit(TopSellingState.error(error)),
    );
  }
}
