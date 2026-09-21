// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_chart_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalesChartDto _$SalesChartDtoFromJson(Map<String, dynamic> json) =>
    SalesChartDto(
      date: DateTime.parse(json['date'] as String),
      total: (json['total'] as num).toDouble(),
      count: (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$SalesChartDtoToJson(SalesChartDto instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'total': instance.total,
      'count': instance.count,
    };
