import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/home/domain/use_cases/low_stock_use_case.dart';
import 'package:skeleton_mobile_app/features/home/domain/use_cases/sales_chart_use_case.dart';
import 'package:skeleton_mobile_app/features/home/domain/use_cases/summary_use_case.dart';
import 'package:skeleton_mobile_app/features/home/domain/use_cases/top_products_use_case.dart';
import 'package:skeleton_mobile_app/features/home/logic/home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final SummaryUseCase summaryUseCase;
  final SalesChartUseCase salesChartUseCase;
  final TopProductsUseCase topProductsUseCase;
  final LowStockUseCase lowStockUseCase;

  HomeCubit(
    this.summaryUseCase,
    this.salesChartUseCase,
    this.topProductsUseCase,
    this.lowStockUseCase,
  ) : super(const HomeState());

  Future<void> getSummary({required int storeId, DateTime? date}) async {
    emit(state.copyWith(summaryState: const RequestState.loading()));

    final formattedDate = (date ?? DateTime.now()).toIso8601String();

    final result = await summaryUseCase.getSummary(storeId, formattedDate);

    result.when(
      success: (data) {
        emit(state.copyWith(summaryState: RequestState.success(data)));
      },
      failure: (error) {
        emit(state.copyWith(summaryState: RequestState.error(error)));
      },
    );
  }

  Future<void> getSalesChart({
    required int storeId,
    String period = 'today',
    int days = 1,
  }) async {
    emit(state.copyWith(salesChartState: const RequestState.loading()));

    final result = await salesChartUseCase.getSalesChart(
      storeId,
      period,
      days,
    );

    result.when(
      success: (data) {
        emit(state.copyWith(salesChartState: RequestState.success(data)));
      },
      failure: (error) {
        emit(state.copyWith(salesChartState: RequestState.error(error)));
      },
    );
  }

  Future<void> getTopProducts({required int storeId, int take = 5}) async {
    emit(state.copyWith(topProductsState: const RequestState.loading()));

    final result = await topProductsUseCase.getTopProducts(storeId, take);

    result.when(
      success: (data) {
        emit(state.copyWith(topProductsState: RequestState.success(data)));
      },
      failure: (error) {
        emit(state.copyWith(topProductsState: RequestState.error(error)));
      },
    );
  }

  Future<void> getLowStock({required int storeId}) async {
    emit(state.copyWith(lowStockState: const RequestState.loading()));

    final result = await lowStockUseCase.getLowStock(storeId);

    result.when(
      success: (data) {
        emit(state.copyWith(lowStockState: RequestState.success(data)));
      },
      failure: (error) {
        emit(state.copyWith(lowStockState: RequestState.error(error)));
      },
    );
  }
}