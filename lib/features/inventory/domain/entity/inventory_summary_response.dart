class InventorySummaryResponse {
  final String? itemType;
  final int? totalProducts;
  final int? lowStock;
  final int? outOfStock;
  final List<String?>? itemTypes;
  InventorySummaryResponse({
    this.itemType,
    this.totalProducts,
    this.lowStock,
    this.outOfStock,
    this.itemTypes,
  });
}
