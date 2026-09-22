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
  ) : super(HomeState.initial());


  

  Future<void> getSummary({required int storeId, DateTime? date}) async {
    emit(HomeState.loading());

    final formattedDate = (date ?? DateTime.now()).toIso8601String();

    final Result = await summaryUseCase.getSummary(storeId, formattedDate);

    Result.when(
      success: (data) {
        emit(HomeState.success(data));
      },
      failure: (error) {
        emit(HomeState.error(error));
      },
    );
  }

  Future<void> getSalesChart({
    required int storeId,
    String period = 'today',
    int days = 1,
  }) async {
    emit(HomeState.loading());

    final Result = await salesChartUseCase.getSalesChart(storeId, period, days);

    Result.when(
      success: (data) {
        emit(HomeState.success(data));
      },
      failure: (error) {
        emit(HomeState.error(error));
      },
    );
  }

  Future<void> getTopProducts({required int storeId, int take = 5}) async {
    emit(HomeState.loading());

    final Result = await topProductsUseCase.getTopProducts(storeId, take);

    Result.when(
      success: (data) {
        emit(HomeState.success(data));
      },
      failure: (error) {
        emit(HomeState.error(error));
      },
    );
  }

  Future<void> getLowStock({required int storeId}) async {
    emit(HomeState.loading());

    final Result = await lowStockUseCase.getLowStock(storeId);

    Result.when(
      success: (data) {
        emit(HomeState.success(data));
      },
      failure: (error) {
        emit(HomeState.error(error));
      },
    );
  }
}
