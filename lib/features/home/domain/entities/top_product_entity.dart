class TopProductEntity {
  final int id;
  final String productName;
  final String itemType;
  final int quantity;
  final double purchasePrice;
  final double sellingPrice;
  final String barcode;
  final int limit;
  final int sold;
  final int storeId;

  const TopProductEntity({
    required this.id,
    required this.productName,
    required this.itemType,
    required this.quantity,
    required this.purchasePrice,
    required this.sellingPrice,
    required this.barcode,
    required this.limit,
    required this.sold,
    required this.storeId,
  });
}
