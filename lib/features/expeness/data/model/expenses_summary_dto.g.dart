// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expenses_summary_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExpensesSummaryDto _$ExpensesSummaryDtoFromJson(Map<String, dynamic> json) =>
    ExpensesSummaryDto(
      storeId: (json['storeId'] as num?)?.toInt(),
      period: json['period'] as String?,
      periodLabel: json['periodLabel'] as String?,
      currency: json['currency'] as String?,
      range: json['range'] == null
          ? null
          : ExpenseDateRangeDto.fromJson(json['range'] as Map<String, dynamic>),
      totalExpenses: json['totalExpenses'] as num?,
      pct: json['pct'] as num?,
      vsLabel: json['vsLabel'] as String?,
      vsTotal: json['vsTotal'] as num?,
      transactions: (json['transactions'] as num?)?.toInt(),
      avgPerTx: json['avgPerTx'] as num?,
      dailyAvg: json['dailyAvg'] as num?,
      highest: json['highest'] == null
          ? null
          : ExpenseSummaryEntryDto.fromJson(
              json['highest'] as Map<String, dynamic>,
            ),
      lowest: json['lowest'] == null
          ? null
          : ExpenseSummaryEntryDto.fromJson(
              json['lowest'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$ExpensesSummaryDtoToJson(ExpensesSummaryDto instance) =>
    <String, dynamic>{
      'storeId': instance.storeId,
      'period': instance.period,
      'periodLabel': instance.periodLabel,
      'currency': instance.currency,
      'range': instance.range,
      'totalExpenses': instance.totalExpenses,
      'pct': instance.pct,
      'vsLabel': instance.vsLabel,
      'vsTotal': instance.vsTotal,
      'transactions': instance.transactions,
      'avgPerTx': instance.avgPerTx,
      'dailyAvg': instance.dailyAvg,
      'highest': instance.highest,
      'lowest': instance.lowest,
    };

ExpenseDateRangeDto _$ExpenseDateRangeDtoFromJson(Map<String, dynamic> json) =>
    ExpenseDateRangeDto(
      from: json['from'] as String?,
      to: json['to'] as String?,
    );

Map<String, dynamic> _$ExpenseDateRangeDtoToJson(
  ExpenseDateRangeDto instance,
) => <String, dynamic>{'from': instance.from, 'to': instance.to};

ExpenseSummaryEntryDto _$ExpenseSummaryEntryDtoFromJson(
  Map<String, dynamic> json,
) => ExpenseSummaryEntryDto(
  id: (json['id'] as num?)?.toInt(),
  value: json['value'] as num?,
  type: json['type'] as String?,
  statement: json['statement'] as String?,
  day: json['day'] as String?,
  dayFormatted: json['dayFormatted'] as String?,
);

Map<String, dynamic> _$ExpenseSummaryEntryDtoToJson(
  ExpenseSummaryEntryDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'value': instance.value,
  'type': instance.type,
  'statement': instance.statement,
  'day': instance.day,
  'dayFormatted': instance.dayFormatted,
};
