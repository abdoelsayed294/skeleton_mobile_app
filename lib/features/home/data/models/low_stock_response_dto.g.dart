// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'low_stock_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LowStockResponseDto _$LowStockResponseDtoFromJson(Map<String, dynamic> json) =>
    LowStockResponseDto(
      count: (json['count'] as num).toInt(),
      lowStockProducts: (json['items'] as List<dynamic>?)
          ?.map((e) => LowStockProductDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LowStockResponseDtoToJson(
  LowStockResponseDto instance,
) => <String, dynamic>{
  'count': instance.count,
  'items': instance.lowStockProducts,
};

LowStockProductDto _$LowStockProductDtoFromJson(Map<String, dynamic> json) =>
    LowStockProductDto(
      productName: json['itemName'] as String,
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$LowStockProductDtoToJson(LowStockProductDto instance) =>
    <String, dynamic>{
      'itemName': instance.productName,
      'quantity': instance.quantity,
    };
