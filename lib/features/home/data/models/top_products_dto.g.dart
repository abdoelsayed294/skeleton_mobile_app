// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_products_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopProductDto _$TopProductDtoFromJson(Map<String, dynamic> json) =>
    TopProductDto(
      id: (json['id'] as num?)?.toInt(),
      itemName: json['itemName'] as String?,
      itemType: json['itemType'] as String?,
      quantity: (json['quantity'] as num?)?.toInt(),
      priceBuy: (json['priceBuy'] as num?)?.toDouble(),
      price1: (json['price1'] as num?)?.toDouble(),
      barcode: json['barcode'] as String?,
      limit: (json['limit'] as num?)?.toInt(),
      sell: (json['sell'] as num?)?.toInt(),
      storeId: (json['storeID'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TopProductDtoToJson(TopProductDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'itemName': instance.itemName,
      'itemType': instance.itemType,
      'quantity': instance.quantity,
      'priceBuy': instance.priceBuy,
      'price1': instance.price1,
      'barcode': instance.barcode,
      'limit': instance.limit,
      'sell': instance.sell,
      'storeID': instance.storeId,
    };
