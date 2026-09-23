// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'today_sales_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodaySalesDto _$TodaySalesDtoFromJson(Map<String, dynamic> json) =>
    TodaySalesDto(
      totalRevenue: (json['totalRevenue'] as num).toDouble(),
      totalSales: (json['totalSales'] as num).toDouble(),
      changePct: (json['changePct'] as num).toDouble(),
      vsLabel: json['vsLabel'] as String,
      orders: (json['orders'] as num).toInt(),
      avgOrder: (json['avgOrder'] as num).toDouble(),
      itemsSold: (json['itemsSold'] as num).toInt(),
      itemsSoldChangePct: (json['itemsSoldChangePct'] as num).toDouble(),
      skus: (json['skus'] as num).toInt(),
      returnsTotal: (json['returnsTotal'] as num).toDouble(),
      returnsOrders: (json['returnsOrders'] as num).toInt(),
      returnsChangePct: (json['returnsChangePct'] as num).toDouble(),
      date: json['date'] as String,
    );

Map<String, dynamic> _$TodaySalesDtoToJson(TodaySalesDto instance) =>
    <String, dynamic>{
      'totalRevenue': instance.totalRevenue,
      'totalSales': instance.totalSales,
      'changePct': instance.changePct,
      'vsLabel': instance.vsLabel,
      'orders': instance.orders,
      'avgOrder': instance.avgOrder,
      'itemsSold': instance.itemsSold,
      'itemsSoldChangePct': instance.itemsSoldChangePct,
      'skus': instance.skus,
      'returnsTotal': instance.returnsTotal,
      'returnsOrders': instance.returnsOrders,
      'returnsChangePct': instance.returnsChangePct,
      'date': instance.date,
    };
