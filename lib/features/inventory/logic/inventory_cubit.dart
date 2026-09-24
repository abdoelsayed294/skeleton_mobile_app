import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/helpers/shared_pref_helper.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/inventory/domain/use_cases/Inventory_proudct_use_case.dart';
import 'package:skeleton_mobile_app/features/inventory/domain/use_cases/inventory_summary_use_case.dart';
import 'package:skeleton_mobile_app/features/inventory/logic/inventory_state.dart';

@injectable
class InventoryCubit extends Cubit<InventoryState> {
  InventoryCubit(this._inventorySummaryUseCase, this._InventoryProductUseCase)
    : super(InventoryState.initial());
  final InventorySummaryUseCase _inventorySummaryUseCase;
  final InventoryProudctUseCase _InventoryProductUseCase;
  Future<void> getInventorySummary({String? itemType}) async {
    emit(InventoryState.loading());
    // i will handle this
    final storeId = await SharedPrefHelper.getInt(SharedPrefHelper.storeIdKey);
    final result = await _inventorySummaryUseCase.invoke(
      storeId,
      itemType: itemType,
    );
    result.when(
      success: (data) => emit(InventoryState.success(data)),
      failure: (error) => emit(InventoryState.error(error)),
    );
  }

  Future<void> getInventoryProducts(
    String? itemType,
    int pageNumber,
    int pageSize,
  ) async {
    emit(InventoryState.loading());
    final storeId = await SharedPrefHelper.getInt(SharedPrefHelper.storeIdKey);
    final result = await _InventoryProductUseCase.invoke(
      storeId,
      itemType,
      pageNumber,
      pageSize,
    );
    result.when(
      success: (data) => emit(InventoryState.success(data)),
      failure: (error) => emit(InventoryState.error(error)),
    );
  }
}
