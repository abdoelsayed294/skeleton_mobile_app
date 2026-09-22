// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_summary_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InventorySummaryResponseDto _$InventorySummaryResponseDtoFromJson(
  Map<String, dynamic> json,
) => InventorySummaryResponseDto(
  storeId: (json['storeId'] as num?)?.toInt(),
  totalProducts: (json['totalProducts'] as num?)?.toInt(),
  products: (json['products'] as num?)?.toInt(),
  lowStock: (json['lowStock'] as num?)?.toInt(),
  outOfStock: (json['outOfStock'] as num?)?.toInt(),
  inStock: (json['inStock'] as num?)?.toInt(),
  itemTypes: (json['itemTypes'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
);

Map<String, dynamic> _$InventorySummaryResponseDtoToJson(
  InventorySummaryResponseDto instance,
) => <String, dynamic>{
  'storeId': instance.storeId,
  'totalProducts': instance.totalProducts,
  'products': instance.products,
  'lowStock': instance.lowStock,
  'outOfStock': instance.outOfStock,
  'inStock': instance.inStock,
  'itemTypes': instance.itemTypes,
};
