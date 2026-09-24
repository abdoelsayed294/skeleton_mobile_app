import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/helpers/shared_pref_helper.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/product_details/domain/use_cases/get_product_sales_history_use_case.dart';
import 'package:skeleton_mobile_app/features/product_details/logic/product_sales_history_state.dart';

@injectable
class ProductSalesHistoryCubit extends Cubit<ProductSalesHistoryState> {
  final GetProductSalesHistoryUseCase _useCase;
  ProductSalesHistoryCubit(this._useCase)
    : super(const ProductSalesHistoryState.initial());

  int _productId = 0;
  String selectedPeriod = 'week';

  Future<void> getProductSalesHistory(int id, {String period = 'week'}) async {
    _productId = id;
    selectedPeriod = period;
    emit(const ProductSalesHistoryState.loading());
    final storeId = await SharedPrefHelper.getInt(SharedPrefHelper.storeIdKey);
    final result = await _useCase.invoke(id, period, storeId);
    result.when(
      success: (data) => emit(ProductSalesHistoryState.success(data)),
      failure: (error) => emit(ProductSalesHistoryState.error(error)),
    );
  }

  Future<void> changePeriod(String period) =>
      getProductSalesHistory(_productId, period: period);
}
