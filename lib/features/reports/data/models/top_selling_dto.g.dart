// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_selling_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopSellingDto _$TopSellingDtoFromJson(Map<String, dynamic> json) =>
    TopSellingDto(
      itemName: json['itemName'] as String,
      unitsSold: (json['unitsSold'] as num).toInt(),
      revenue: (json['revenue'] as num).toDouble(),
      revenuePct: (json['revenuePct'] as num).toDouble(),
      changePct: (json['changePct'] as num).toDouble(),
    );

Map<String, dynamic> _$TopSellingDtoToJson(TopSellingDto instance) =>
    <String, dynamic>{
      'itemName': instance.itemName,
      'unitsSold': instance.unitsSold,
      'revenue': instance.revenue,
      'revenuePct': instance.revenuePct,
      'changePct': instance.changePct,
    };
