// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_sales_dto.dart';

DailySalesDto _$DailySalesDtoFromJson(Map<String, dynamic> json) =>
    DailySalesDto(
      date: json['date'] as String,
      revenue: (json['revenue'] as num).toDouble(),
    );

Map<String, dynamic> _$DailySalesDtoToJson(DailySalesDto instance) =>
    <String, dynamic>{'date': instance.date, 'revenue': instance.revenue};
