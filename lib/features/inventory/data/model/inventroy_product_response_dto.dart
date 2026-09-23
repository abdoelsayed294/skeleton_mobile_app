import 'package:json_annotation/json_annotation.dart';

part 'inventroy_product_response_dto.g.dart';

@JsonSerializable()
class InventroyProductResponseDto {
  @JsonKey(name: 'items')
  final List<Items?>? items;
  @JsonKey(name: 'total')
  final int? total;
  @JsonKey(name: 'page')
  final int? page;
  @JsonKey(name: 'pageSize')
  final int? pageSize;

  InventroyProductResponseDto({
    this.items,
    this.total,
    this.page,
    this.pageSize,
  });

  factory InventroyProductResponseDto.fromJson(Map<String, dynamic> json) => _$InventroyProductResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$InventroyProductResponseDtoToJson(this);
}

@JsonSerializable()
class Items {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'itemName')
  final String? itemName;
  @JsonKey(name: 'itemType')
  final String? itemType;
  @JsonKey(name: 'barcode')
  final String? barcode;
  @JsonKey(name: 'sku')
  final dynamic sku;
  @JsonKey(name: 'price1')
  final int? price1;
  @JsonKey(name: 'priceBuy')
  final int? priceBuy;
  @JsonKey(name: 'quantity')
  final int? quantity;
  @JsonKey(name: 'minStockLevel')
  final int? minStockLevel;
  @JsonKey(name: 'storeID')
  final int? storeID;
  @JsonKey(name: 'imageUrl')
  final dynamic imageUrl;
  @JsonKey(name: 'stockStatus')
  final String? stockStatus;
  @JsonKey(name: 'stockBadge')
  final String? stockBadge;
  @JsonKey(name: 'quantityValue')
  final int? quantityValue;
  @JsonKey(name: 'minStock')
  final int? minStock;

  Items({
    this.id,
    this.itemName,
    this.itemType,
    this.barcode,
    this.sku,
    this.price1,
    this.priceBuy,
    this.quantity,
    this.minStockLevel,
    this.storeID,
    this.imageUrl,
    this.stockStatus,
    this.stockBadge,
    this.quantityValue,
    this.minStock,
  });

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);
  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}