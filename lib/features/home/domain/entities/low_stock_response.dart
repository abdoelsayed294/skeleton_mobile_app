class LowStockResponse {
  final int count;
  final List<LowStockProduct>? lowStockProducts;

  LowStockResponse({required this.count, this.lowStockProducts});
}

class LowStockProduct {
  final String productName;
  final int quantity;
  final int limit;

  LowStockProduct({required this.productName, required this.quantity, required this.limit});
}
