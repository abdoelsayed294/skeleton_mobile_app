import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/product_details/domain/use_cases/get_product_header_use_case.dart';
import 'package:skeleton_mobile_app/features/product_details/logic/product_header_state.dart';

@injectable
class ProductHeaderCubit extends Cubit<ProductHeaderState> {
  final GetProductHeaderUseCase _useCase;
  ProductHeaderCubit(this._useCase) : super(const ProductHeaderState.initial());

  Future<void> getProductHeader(int id) async {
    emit(const ProductHeaderState.loading());
    final result = await _useCase.invoke(id);
    result.when(
      success: (data) => emit(ProductHeaderState.success(data)),
      failure: (error) => emit(ProductHeaderState.error(error)),
    );
  }
}
