import 'package:json_annotation/json_annotation.dart';

part 'product_details_dto.g.dart';

@JsonSerializable()
class ProductActivityDto {
  @JsonKey(name: 'productId')
  final int? productId;
  @JsonKey(name: 'itemName')
  final String? itemName;
  @JsonKey(name: 'sold')
  final int? sold;
  @JsonKey(name: 'purchased')
  final int? purchased;
  @JsonKey(name: 'damaged')
  final int? damaged;
  @JsonKey(name: 'salesReturn')
  final int? salesReturn;
  @JsonKey(name: 'purchaseReturn')
  final int? purchaseReturn;

  const ProductActivityDto({
    this.productId,
    this.itemName,
    this.sold,
    this.purchased,
    this.damaged,
    this.salesReturn,
    this.purchaseReturn,
  });

  factory ProductActivityDto.fromJson(Map<String, dynamic> json) =>
      _$ProductActivityDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ProductActivityDtoToJson(this);
}

@JsonSerializable()
class ProductHeaderDto {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'itemName')
  final String? itemName;
  @JsonKey(name: 'barcode')
  final String? barcode;
  @JsonKey(name: 'itemType')
  final String? itemType;
  @JsonKey(name: 'stockStatus')
  final String? stockStatus;
  @JsonKey(name: 'quantity')
  final int? quantity;
  @JsonKey(name: 'limit')
  final int? limit;

  const ProductHeaderDto({
    this.id,
    this.itemName,
    this.barcode,
    this.itemType,
    this.stockStatus,
    this.quantity,
    this.limit,
  });

  factory ProductHeaderDto.fromJson(Map<String, dynamic> json) =>
      _$ProductHeaderDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ProductHeaderDtoToJson(this);
}

@JsonSerializable()
class ProductPricingDto {
  @JsonKey(name: 'productId')
  final int? productId;
  @JsonKey(name: 'purchasePrice')
  final double? purchasePrice;
  @JsonKey(name: 'sellingPrice')
  final double? sellingPrice;
  @JsonKey(name: 'profitPerUnit')
  final double? profitPerUnit;
  @JsonKey(name: 'profitMargin')
  final double? profitMargin;
  @JsonKey(name: 'marginLabel')
  final String? marginLabel;

  const ProductPricingDto({
    this.productId,
    this.purchasePrice,
    this.sellingPrice,
    this.profitPerUnit,
    this.profitMargin,
    this.marginLabel,
  });

  factory ProductPricingDto.fromJson(Map<String, dynamic> json) =>
      _$ProductPricingDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ProductPricingDtoToJson(this);
}

@JsonSerializable()
class ProductInventoryDto {
  @JsonKey(name: 'productId')
  final int? productId;
  @JsonKey(name: 'currentStock')
  final int? currentStock;
  @JsonKey(name: 'minimumStockLevel')
  final int? minimumStockLevel;
  @JsonKey(name: 'unitsSoldToday')
  final int? unitsSoldToday;
  @JsonKey(name: 'unitsSoldThisWeek')
  final int? unitsSoldThisWeek;
  @JsonKey(name: 'unitsSoldThisMonth')
  final int? unitsSoldThisMonth;

  const ProductInventoryDto({
    this.productId,
    this.currentStock,
    this.minimumStockLevel,
    this.unitsSoldToday,
    this.unitsSoldThisWeek,
    this.unitsSoldThisMonth,
  });

  factory ProductInventoryDto.fromJson(Map<String, dynamic> json) =>
      _$ProductInventoryDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ProductInventoryDtoToJson(this);
}

@JsonSerializable()
class ProductSalesHistoryDto {
  @JsonKey(name: 'productId')
  final int? productId;
  @JsonKey(name: 'period')
  final String? period;
  @JsonKey(name: 'totalUnits')
  final int? totalUnits;
  @JsonKey(name: 'changePct')
  final double? changePct;
  @JsonKey(name: 'vsLabel')
  final String? vsLabel;
  @JsonKey(name: 'chart')
  final List<ProductSalesHistoryPointDto>? chart;

  const ProductSalesHistoryDto({
    this.productId,
    this.period,
    this.totalUnits,
    this.changePct,
    this.vsLabel,
    this.chart,
  });

  factory ProductSalesHistoryDto.fromJson(Map<String, dynamic> json) =>
      _$ProductSalesHistoryDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ProductSalesHistoryDtoToJson(this);
}

@JsonSerializable()
class ProductSalesHistoryPointDto {
  @JsonKey(name: 'label')
  final String? label;
  @JsonKey(name: 'date')
  final String? date;
  @JsonKey(name: 'units')
  final int? units;

  const ProductSalesHistoryPointDto({this.label, this.date, this.units});

  factory ProductSalesHistoryPointDto.fromJson(Map<String, dynamic> json) =>
      _$ProductSalesHistoryPointDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ProductSalesHistoryPointDtoToJson(this);
}
