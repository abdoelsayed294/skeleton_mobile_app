
class InventorySummaryResponse {
  final int? totalProducts;
  final int? lowStock;
  final int? outOfStock;
  final List<String?>? itemTypes;
  InventorySummaryResponse({
    this.totalProducts,
    this.lowStock,
    this.outOfStock,
    this.itemTypes,
  });

  
}