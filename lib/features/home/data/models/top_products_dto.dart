import 'package:json_annotation/json_annotation.dart';

part 'top_products_dto.g.dart';

@JsonSerializable()
class TopProductDto {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'itemName')
  final String? itemName;
  @JsonKey(name: 'itemType')
  final String? itemType;
  @JsonKey(name: 'quantity')
  final int? quantity;
  @JsonKey(name: 'priceBuy')
  final double? priceBuy;
  @JsonKey(name: 'price1')
  final double? price1;
  @JsonKey(name: 'barcode')
  final String? barcode;
  @JsonKey(name: 'limit')
  final int? limit;
  @JsonKey(name: 'sell')
  final int? sell;
  @JsonKey(name: 'storeID')
  final int? storeId;

  const TopProductDto({
    this.id,
    this.itemName,
    this.itemType,
    this.quantity,
    this.priceBuy,
    this.price1,
    this.barcode,
    this.limit,
    this.sell,
    this.storeId,
  });

  factory TopProductDto.fromJson(Map<String, dynamic> json) =>
      _$TopProductDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TopProductDtoToJson(this);
}
