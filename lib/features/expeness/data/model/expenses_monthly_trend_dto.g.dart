// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expenses_monthly_trend_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExpensesMonthlyTrendDto _$ExpensesMonthlyTrendDtoFromJson(
  Map<String, dynamic> json,
) => ExpensesMonthlyTrendDto(
  storeId: (json['storeId'] as num?)?.toInt(),
  year: (json['year'] as num?)?.toInt(),
  currency: json['currency'] as String?,
  total: json['total'] as num?,
  chart: (json['chart'] as List<dynamic>?)
      ?.map(
        (e) => ExpensesMonthlyTrendItemDto.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$ExpensesMonthlyTrendDtoToJson(
  ExpensesMonthlyTrendDto instance,
) => <String, dynamic>{
  'storeId': instance.storeId,
  'year': instance.year,
  'currency': instance.currency,
  'total': instance.total,
  'chart': instance.chart,
};

ExpensesMonthlyTrendItemDto _$ExpensesMonthlyTrendItemDtoFromJson(
  Map<String, dynamic> json,
) => ExpensesMonthlyTrendItemDto(
  label: json['label'] as String?,
  month: json['month'] as String?,
  from: json['from'] as String?,
  to: json['to'] as String?,
  total: json['total'] as num?,
);

Map<String, dynamic> _$ExpensesMonthlyTrendItemDtoToJson(
  ExpensesMonthlyTrendItemDto instance,
) => <String, dynamic>{
  'label': instance.label,
  'month': instance.month,
  'from': instance.from,
  'to': instance.to,
  'total': instance.total,
};
