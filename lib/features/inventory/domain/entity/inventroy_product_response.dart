

class InventroyProductResponse {
  final List<Items?>? items;
  final int? total;
  final int? page;
  final int? pageSize;

  InventroyProductResponse({
    this.items,
    this.total,
    this.page,
    this.pageSize,
  });

}

class Items {
  final int? id;
  final String? itemName;
  final String? itemType;
  final int? price1;
  final int? quantity;
  final int? minStockLevel;
  final dynamic imageUrl;
  final String? stockStatus;
  final String? stockBadge;
  final int? quantityValue;
  final int? minStock;

  Items({
    this.id,
    this.itemName,
    this.itemType,
    this.price1,
    this.quantity,
    this.minStockLevel,
    this.imageUrl,
    this.stockStatus,
    this.stockBadge,
    this.quantityValue,
    this.minStock,
  });


}