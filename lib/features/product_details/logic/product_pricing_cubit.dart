import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/product_details/domain/use_cases/get_product_pricing_use_case.dart';
import 'package:skeleton_mobile_app/features/product_details/logic/product_pricing_state.dart';

@injectable
class ProductPricingCubit extends Cubit<ProductPricingState> {
  final GetProductPricingUseCase _useCase;
  ProductPricingCubit(this._useCase)
    : super(const ProductPricingState.initial());

  Future<void> getProductPricing(int id) async {
    emit(const ProductPricingState.loading());
    final result = await _useCase.invoke(id);
    result.when(
      success: (data) => emit(ProductPricingState.success(data)),
      failure: (error) => emit(ProductPricingState.error(error)),
    );
  }
}
