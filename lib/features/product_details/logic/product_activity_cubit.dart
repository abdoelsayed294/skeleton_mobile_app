import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/product_details/domain/use_cases/get_product_activity_use_case.dart';
import 'package:skeleton_mobile_app/features/product_details/logic/product_activity_state.dart';

@injectable
class ProductActivityCubit extends Cubit<ProductActivityState> {
  final GetProductActivityUseCase _useCase;
  ProductActivityCubit(this._useCase)
    : super(const ProductActivityState.initial());

  Future<void> getProductActivity(int id) async {
    emit(const ProductActivityState.loading());
    final result = await _useCase.invoke(id);
    result.when(
      success: (data) => emit(ProductActivityState.success(data)),
      failure: (error) => emit(ProductActivityState.error(error)),
    );
  }
}
