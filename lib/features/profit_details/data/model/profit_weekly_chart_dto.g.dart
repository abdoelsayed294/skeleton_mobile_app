// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profit_weekly_chart_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfitWeeklyChartDto _$ProfitWeeklyChartDtoFromJson(
  Map<String, dynamic> json,
) => ProfitWeeklyChartDto(
  range: json['range'] == null
      ? null
      : ProfitChartRangeDto.fromJson(json['range'] as Map<String, dynamic>),
  weeklyProfitSummary: (json['weeklyProfitSummary'] as List<dynamic>?)
      ?.map((e) => ProfitWeeklyDayDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  weekTotal: (json['weekTotal'] as num?)?.toDouble(),
);

Map<String, dynamic> _$ProfitWeeklyChartDtoToJson(
  ProfitWeeklyChartDto instance,
) => <String, dynamic>{
  'range': instance.range,
  'weeklyProfitSummary': instance.weeklyProfitSummary,
  'weekTotal': instance.weekTotal,
};

ProfitChartRangeDto _$ProfitChartRangeDtoFromJson(Map<String, dynamic> json) =>
    ProfitChartRangeDto(
      from: json['from'] as String?,
      to: json['to'] as String?,
    );

Map<String, dynamic> _$ProfitChartRangeDtoToJson(
  ProfitChartRangeDto instance,
) => <String, dynamic>{'from': instance.from, 'to': instance.to};

ProfitWeeklyDayDto _$ProfitWeeklyDayDtoFromJson(Map<String, dynamic> json) =>
    ProfitWeeklyDayDto(
      date: json['date'] as String?,
      revenue: (json['revenue'] as num?)?.toDouble(),
      netProfit: (json['netProfit'] as num?)?.toDouble(),
      gross: (json['gross'] as num?)?.toDouble(),
      cogs: (json['cogs'] as num?)?.toDouble(),
      expenses: (json['expenses'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ProfitWeeklyDayDtoToJson(ProfitWeeklyDayDto instance) =>
    <String, dynamic>{
      'date': instance.date,
      'revenue': instance.revenue,
      'netProfit': instance.netProfit,
      'gross': instance.gross,
      'cogs': instance.cogs,
      'expenses': instance.expenses,
    };
