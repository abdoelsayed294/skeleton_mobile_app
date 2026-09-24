// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reports_sales_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportsSalesDto _$ReportsSalesDtoFromJson(Map<String, dynamic> json) =>
    ReportsSalesDto(
      period: json['period'] as String,
      from: json['from'] as String,
      to: json['to'] as String,
      totalSales: (json['totalSales'] as num).toDouble(),
      salesChangePct: (json['salesChangePct'] as num).toDouble(),
      orders: (json['orders'] as num).toInt(),
      ordersChangePct: (json['ordersChangePct'] as num?)?.toDouble() ?? 0,
      avgOrder: (json['avgOrder'] as num).toDouble(),
      customers: (json['customers'] as num).toInt(),
      daily:
          (json['daily'] as List<dynamic>?)
              ?.map((e) => DailySalesDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      breakdown:
          (json['breakdown'] as List<dynamic>?)
              ?.map(
                (e) => PaymentBreakdownDto.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      topSelling:
          (json['topSelling'] as List<dynamic>?)
              ?.map((e) => TopSellingDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ReportsSalesDtoToJson(ReportsSalesDto instance) =>
    <String, dynamic>{
      'period': instance.period,
      'from': instance.from,
      'to': instance.to,
      'totalSales': instance.totalSales,
      'salesChangePct': instance.salesChangePct,
      'orders': instance.orders,
      'ordersChangePct': instance.ordersChangePct,
      'avgOrder': instance.avgOrder,
      'customers': instance.customers,
      'daily': instance.daily,
      'breakdown': instance.breakdown,
      'topSelling': instance.topSelling,
    };
