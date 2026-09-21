
import 'package:json_annotation/json_annotation.dart';

part 'low_stock_response_dto.g.dart';

@JsonSerializable()
class LowStockResponseDto{
  @JsonKey(name: 'count')
  final int count;
  @JsonKey(name: 'items')
  final List<LowStockProductDto>? lowStockProducts;

  LowStockResponseDto({
    required this.count,
    this.lowStockProducts,
  });

  factory LowStockResponseDto.fromJson(Map<String, dynamic> json) =>
      _$LowStockResponseDtoFromJson(json);
  
  Map<String, dynamic> toJson() => _$LowStockResponseDtoToJson(this);
}

@JsonSerializable()
class LowStockProductDto {
  @JsonKey(name: 'itemName')
  final String productName;
  @JsonKey(name: 'quantity')
  final int quantity;

  LowStockProductDto({
    required this.productName,
    required this.quantity,
  });

  factory LowStockProductDto.fromJson(Map<String, dynamic> json) =>
      _$LowStockProductDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LowStockProductDtoToJson(this);
}
