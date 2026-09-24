import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/product_details/domain/use_cases/get_product_inventory_use_case.dart';
import 'package:skeleton_mobile_app/features/product_details/logic/product_inventory_state.dart';

@injectable
class ProductInventoryCubit extends Cubit<ProductInventoryState> {
  final GetProductInventoryUseCase _useCase;
  ProductInventoryCubit(this._useCase)
    : super(const ProductInventoryState.initial());

  Future<void> getProductInventory(int id) async {
    emit(const ProductInventoryState.loading());
    final result = await _useCase.invoke(id);
    result.when(
      success: (data) => emit(ProductInventoryState.success(data)),
      failure: (error) => emit(ProductInventoryState.error(error)),
    );
  }
}
