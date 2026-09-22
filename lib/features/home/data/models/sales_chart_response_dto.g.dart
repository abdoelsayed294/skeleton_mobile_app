// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_chart_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalesChartResponseDto _$SalesChartResponseDtoFromJson(
  Map<String, dynamic> json,
) => SalesChartResponseDto(
  period: json['period'] as String,
  total: (json['totalRevenue'] as num).toDouble(),
  changePct: (json['changePct'] as num).toDouble(),
  vsLabel: json['vsLabel'] as String,
  chart: (json['chart'] as List<dynamic>)
      .map((e) => ChartPointDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$SalesChartResponseDtoToJson(
  SalesChartResponseDto instance,
) => <String, dynamic>{
  'period': instance.period,
  'totalRevenue': instance.total,
  'changePct': instance.changePct,
  'vsLabel': instance.vsLabel,
  'chart': instance.chart,
};

ChartPointDto _$ChartPointDtoFromJson(Map<String, dynamic> json) =>
    ChartPointDto(
      date: json['date'] as String,
      total: (json['total'] as num).toDouble(),
      count: (json['count'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ChartPointDtoToJson(ChartPointDto instance) =>
    <String, dynamic>{
      'date': instance.date,
      'total': instance.total,
      'count': instance.count,
    };
