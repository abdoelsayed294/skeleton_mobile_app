import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/helpers/shared_pref_helper.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/inventory/domain/entity/inventroy_product_response.dart';
import 'package:skeleton_mobile_app/features/inventory/domain/use_cases/Inventory_proudct_use_case.dart';
import 'package:skeleton_mobile_app/features/inventory/logic/inventory_product_state.dart';

@injectable
class InventoryProductCubit
    extends Cubit<InventoryProductState> {
  InventoryProductCubit(
    this._inventoryProductUseCase,
  ) : super(const InventoryProductState.initial());

  final InventoryProudctUseCase _inventoryProductUseCase;
  String? _selectedItemType;
  String? _searchQuery;
  final List<Items?> _loadedProducts = [];
  int _currentPage = 0;
  int _pageSize = 20;
  int? _totalProducts;
  bool _hasMore = true;
  bool _isLoadingMore = false;
  int _requestId = 0;

  bool get hasMore => _hasMore;
  bool get isLoadingMore => _isLoadingMore;

  Future<void> getInventoryProducts({
    String? itemType,
    int pageNumber = 1,
    int pageSize = 20,
    String? search,
  }) async {
    final requestId = ++_requestId;
    _selectedItemType = itemType;
    _searchQuery = search;
    _currentPage = 0;
    _pageSize = pageSize;
    _totalProducts = null;
    _hasMore = true;
    _isLoadingMore = false;
    _loadedProducts.clear();
    emit(const InventoryProductState.loading());

    final storeId = await SharedPrefHelper.getInt(
      SharedPrefHelper.storeIdKey,
    );

    final result = await _inventoryProductUseCase.invoke(
      storeId,
      itemType,
      pageNumber,
      pageSize,
      search: search,
    );

    if (requestId != _requestId) return;

    result.when(
      success: (data) {
        _loadedProducts.addAll(data.items ?? []);
        _currentPage = data.page ?? pageNumber;
        _totalProducts = data.total;
        _hasMore = _canLoadMore(data.items?.length ?? 0);
        emit(InventoryProductState.success(_responseFrom(data)));
      },
      failure: (error) {
        emit(InventoryProductState.error(error));
      },
    );
  }

  Future<void> searchProducts(String query) {
    return getInventoryProducts(
      itemType: _selectedItemType,
      search: query.trim().isEmpty ? null : query.trim(),
    );
  }

  Future<bool> loadNextPage() async {
    if (_isLoadingMore || !_hasMore) return false;

    final requestId = ++_requestId;
    _isLoadingMore = true;
    final nextPage = _currentPage + 1;
    final storeId = await SharedPrefHelper.getInt(SharedPrefHelper.storeIdKey);
    final result = await _inventoryProductUseCase.invoke(
      storeId,
      _selectedItemType,
      nextPage,
      _pageSize,
      search: _searchQuery,
    );

    if (requestId != _requestId) return false;
    _isLoadingMore = false;

    result.when(
      success: (data) {
        _loadedProducts.addAll(data.items ?? []);
        _currentPage = data.page ?? nextPage;
        _totalProducts = data.total ?? _totalProducts;
        _hasMore = _canLoadMore(data.items?.length ?? 0);
        emit(InventoryProductState.success(_responseFrom(data)));
      },
      failure: (error) => emit(InventoryProductState.error(error)),
    );

    return true;
  }

  bool _canLoadMore(int latestPageItemCount) {
    if (_totalProducts != null) {
      return _loadedProducts.length < _totalProducts!;
    }
    return latestPageItemCount >= _pageSize;
  }

  InventroyProductResponse _responseFrom(InventroyProductResponse response) {
    return InventroyProductResponse(
      items: List.unmodifiable(_loadedProducts),
      total: _totalProducts,
      page: _currentPage,
      pageSize: _pageSize,
    );
  }
}
