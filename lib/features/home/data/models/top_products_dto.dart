
import 'package:json_annotation/json_annotation.dart';

part 'top_products_dto.g.dart';

@JsonSerializable()
class TopProductDto {
  @JsonKey(name: 'itemName')
  final String productName;
  @JsonKey(name: 'totalQty')
  final int quantitySold;
  @JsonKey(name: 'totalValue')
  final double totalValue;

  TopProductDto({
    required this.productName,
    required this.quantitySold,
    required this.totalValue,
  });

  factory TopProductDto.fromJson(Map<String, dynamic> json) =>
      _$TopProductDtoFromJson(json);
  
  Map<String, dynamic> toJson() => _$TopProductDtoToJson(this);
}
