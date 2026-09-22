import 'package:json_annotation/json_annotation.dart';

part 'low_stock_response_dto.g.dart';

@JsonSerializable()
class LowStockResponseDto {
  @JsonKey(name: 'count')
  final int count;
  @JsonKey(name: 'items')
  final List<LowStockProductDto>? lowStockProducts;

  LowStockResponseDto({required this.count, this.lowStockProducts});

  factory LowStockResponseDto.fromJson(Map<String, dynamic> json) =>
      _$LowStockResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LowStockResponseDtoToJson(this);
}

@JsonSerializable()
class LowStockProductDto {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'itemName')
  final String productName;
  @JsonKey(name: 'quantity')
  final int quantity;
  @JsonKey(name: 'limit')
  final int limit;
  @JsonKey(name: 'minStockLevel')
  final int? minStockLevel;
  @JsonKey(name: 'barcode')
  final String? barcode;
  @JsonKey(name: 'sku')
  final String? sku;
  @JsonKey(name: 'left')
  final int left;

  LowStockProductDto({
    required this.id,
    required this.productName,
    required this.quantity,
    required this.limit,
    this.minStockLevel,
    this.barcode,
    this.sku,
    required this.left
  });

  factory LowStockProductDto.fromJson(Map<String, dynamic> json) =>
      _$LowStockProductDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LowStockProductDtoToJson(this);
}