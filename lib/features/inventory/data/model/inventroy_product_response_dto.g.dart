// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventroy_product_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InventroyProductResponseDto _$InventroyProductResponseDtoFromJson(
  Map<String, dynamic> json,
) => InventroyProductResponseDto(
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => e == null ? null : Items.fromJson(e as Map<String, dynamic>))
      .toList(),
  total: (json['total'] as num?)?.toInt(),
  page: (json['page'] as num?)?.toInt(),
  pageSize: (json['pageSize'] as num?)?.toInt(),
);

Map<String, dynamic> _$InventroyProductResponseDtoToJson(
  InventroyProductResponseDto instance,
) => <String, dynamic>{
  'items': instance.items,
  'total': instance.total,
  'page': instance.page,
  'pageSize': instance.pageSize,
};

Items _$ItemsFromJson(Map<String, dynamic> json) => Items(
  id: (json['id'] as num?)?.toInt(),
  itemName: json['itemName'] as String?,
  itemType: json['itemType'] as String?,
  barcode: json['barcode'] as String?,
  sku: json['sku'],
  price1: (json['price1'] as num?)?.toInt(),
  priceBuy: (json['priceBuy'] as num?)?.toInt(),
  quantity: (json['quantity'] as num?)?.toInt(),
  minStockLevel: (json['minStockLevel'] as num?)?.toInt(),
  storeID: (json['storeID'] as num?)?.toInt(),
  imageUrl: json['imageUrl'],
  stockStatus: json['stockStatus'] as String?,
  stockBadge: json['stockBadge'] as String?,
  quantityValue: (json['quantityValue'] as num?)?.toInt(),
  minStock: (json['minStock'] as num?)?.toInt(),
);

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
  'id': instance.id,
  'itemName': instance.itemName,
  'itemType': instance.itemType,
  'barcode': instance.barcode,
  'sku': instance.sku,
  'price1': instance.price1,
  'priceBuy': instance.priceBuy,
  'quantity': instance.quantity,
  'minStockLevel': instance.minStockLevel,
  'storeID': instance.storeID,
  'imageUrl': instance.imageUrl,
  'stockStatus': instance.stockStatus,
  'stockBadge': instance.stockBadge,
  'quantityValue': instance.quantityValue,
  'minStock': instance.minStock,
};
