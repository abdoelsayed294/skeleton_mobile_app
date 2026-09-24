import 'package:json_annotation/json_annotation.dart';

part 'inventory_summary_response_dto.g.dart';

@JsonSerializable()
class InventorySummaryResponseDto {
  @JsonKey(name: 'itemType')
  final String? itemType;
  @JsonKey(name: 'storeId')
  final int? storeId;
  @JsonKey(name: 'totalProducts')
  final int? totalProducts;
  @JsonKey(name: 'products')
  final int? products;
  @JsonKey(name: 'lowStock')
  final int? lowStock;
  @JsonKey(name: 'outOfStock')
  final int? outOfStock;
  @JsonKey(name: 'inStock')
  final int? inStock;
  @JsonKey(name: 'itemTypes')
  final List<String?>? itemTypes;

  InventorySummaryResponseDto({
    this.itemType,
    this.storeId,
    this.totalProducts,
    this.products,
    this.lowStock,
    this.outOfStock,
    this.inStock,
    this.itemTypes,
  });

  factory InventorySummaryResponseDto.fromJson(Map<String, dynamic> json) =>
      _$InventorySummaryResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$InventorySummaryResponseDtoToJson(this);
}
