// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'today_sales_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodaySalesDto _$TodaySalesDtoFromJson(Map<String, dynamic> json) =>
    TodaySalesDto(
      totalRevenue: (json['totalRevenue'] as num?)?.toDouble() ?? 0.0,
      changePct: (json['changePct'] as num?)?.toDouble() ?? 0.0,
      vsLabel: json['vsLabel'] as String? ?? '',
      orders: (json['orders'] as num?)?.toInt() ?? 0,
      avgOrder: (json['avgOrder'] as num?)?.toDouble() ?? 0.0,
      itemsSold: (json['itemsSold'] as num?)?.toInt() ?? 0,
      itemsSoldChangePct:
          (json['itemsSoldChangePct'] as num?)?.toDouble() ?? 0.0,
      returnsTotal: (json['returnsTotal'] as num?)?.toDouble() ?? 0.0,
      returnsOrders: (json['returnsOrders'] as num?)?.toInt() ?? 0,
      returnsChangePct: (json['returnsChangePct'] as num?)?.toDouble() ?? 0.0,
      date: json['date'] as String? ?? '',
    );

Map<String, dynamic> _$TodaySalesDtoToJson(TodaySalesDto instance) =>
    <String, dynamic>{
      'totalRevenue': instance.totalRevenue,
      'changePct': instance.changePct,
      'vsLabel': instance.vsLabel,
      'orders': instance.orders,
      'avgOrder': instance.avgOrder,
      'itemsSold': instance.itemsSold,
      'itemsSoldChangePct': instance.itemsSoldChangePct,
      'returnsTotal': instance.returnsTotal,
      'returnsOrders': instance.returnsOrders,
      'returnsChangePct': instance.returnsChangePct,
      'date': instance.date,
    };
