class ProductActivityEntity {
  final int productId;
  final String itemName;
  final int sold;
  final int purchased;
  final int damaged;
  final int salesReturn;
  final int purchaseReturn;

  const ProductActivityEntity({
    required this.productId,
    required this.itemName,
    required this.sold,
    required this.purchased,
    required this.damaged,
    required this.salesReturn,
    required this.purchaseReturn,
  });
}

class ProductHeaderEntity {
  final int id;
  final String itemName;
  final String barcode;
  final String itemType;
  final String stockStatus;
  final int quantity;
  final int limit;

  const ProductHeaderEntity({
    required this.id,
    required this.itemName,
    required this.barcode,
    required this.itemType,
    required this.stockStatus,
    required this.quantity,
    required this.limit,
  });
}

class ProductPricingEntity {
  final int productId;
  final double purchasePrice;
  final double sellingPrice;
  final double profitPerUnit;
  final double profitMargin;
  final String marginLabel;

  const ProductPricingEntity({
    required this.productId,
    required this.purchasePrice,
    required this.sellingPrice,
    required this.profitPerUnit,
    required this.profitMargin,
    required this.marginLabel,
  });
}

class ProductInventoryEntity {
  final int productId;
  final int currentStock;
  final int minimumStockLevel;
  final int unitsSoldToday;
  final int unitsSoldThisWeek;
  final int unitsSoldThisMonth;

  const ProductInventoryEntity({
    required this.productId,
    required this.currentStock,
    required this.minimumStockLevel,
    required this.unitsSoldToday,
    required this.unitsSoldThisWeek,
    required this.unitsSoldThisMonth,
  });
}

class ProductSalesHistoryEntity {
  final int productId;
  final String period;
  final int totalUnits;
  final double changePct;
  final String vsLabel;
  final List<ProductSalesHistoryPointEntity> chart;

  const ProductSalesHistoryEntity({
    required this.productId,
    required this.period,
    required this.totalUnits,
    required this.changePct,
    required this.vsLabel,
    required this.chart,
  });
}

class ProductSalesHistoryPointEntity {
  final String label;
  final String date;
  final int units;

  const ProductSalesHistoryPointEntity({
    required this.label,
    required this.date,
    required this.units,
  });
}
