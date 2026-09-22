// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_products_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopProductDto _$TopProductDtoFromJson(Map<String, dynamic> json) =>
    TopProductDto(
      productName: json['itemName'] as String,
      quantitySold: (json['totalQty'] as num).toInt(),
      totalValue: (json['totalValue'] as num).toDouble(),
    );

Map<String, dynamic> _$TopProductDtoToJson(TopProductDto instance) =>
    <String, dynamic>{
      'itemName': instance.productName,
      'totalQty': instance.quantitySold,
      'totalValue': instance.totalValue,
    };
