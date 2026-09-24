// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profit_summary_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfitSummaryDto _$ProfitSummaryDtoFromJson(Map<String, dynamic> json) =>
    ProfitSummaryDto(
      period: json['period'] as String?,
      range: json['range'] == null
          ? null
          : ProfitRangeDto.fromJson(json['range'] as Map<String, dynamic>),
      netProfit: json['netProfit'] == null
          ? null
          : ProfitMetricDto.fromJson(json['netProfit'] as Map<String, dynamic>),
      grossProfit: json['grossProfit'] == null
          ? null
          : ProfitMetricDto.fromJson(
              json['grossProfit'] as Map<String, dynamic>,
            ),
      margin: json['margin'] == null
          ? null
          : ProfitMetricDto.fromJson(json['margin'] as Map<String, dynamic>),
      revenue: json['revenue'] == null
          ? null
          : ProfitMetricDto.fromJson(json['revenue'] as Map<String, dynamic>),
      expenses: json['expenses'] == null
          ? null
          : ProfitMetricDto.fromJson(json['expenses'] as Map<String, dynamic>),
      cogs: (json['cogs'] as num?)?.toDouble(),
      returnedLoss: (json['returnedLoss'] as num?)?.toDouble(),
      damagedPaid: (json['damagedPaid'] as num?)?.toDouble(),
      profitBreakdownByPayment: json['profitBreakdownByPayment'] == null
          ? null
          : ProfitPaymentBreakdownDto.fromJson(
              json['profitBreakdownByPayment'] as Map<String, dynamic>,
            ),
      expenseBreakdown: (json['expenseBreakdown'] as List<dynamic>?)
          ?.map(
            (e) =>
                ProfitExpenseBreakdownDto.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$ProfitSummaryDtoToJson(ProfitSummaryDto instance) =>
    <String, dynamic>{
      'period': instance.period,
      'range': instance.range,
      'netProfit': instance.netProfit,
      'grossProfit': instance.grossProfit,
      'margin': instance.margin,
      'revenue': instance.revenue,
      'expenses': instance.expenses,
      'cogs': instance.cogs,
      'returnedLoss': instance.returnedLoss,
      'damagedPaid': instance.damagedPaid,
      'profitBreakdownByPayment': instance.profitBreakdownByPayment,
      'expenseBreakdown': instance.expenseBreakdown,
    };

ProfitRangeDto _$ProfitRangeDtoFromJson(Map<String, dynamic> json) =>
    ProfitRangeDto(from: json['from'] as String?, to: json['to'] as String?);

Map<String, dynamic> _$ProfitRangeDtoToJson(ProfitRangeDto instance) =>
    <String, dynamic>{'from': instance.from, 'to': instance.to};

ProfitMetricDto _$ProfitMetricDtoFromJson(Map<String, dynamic> json) =>
    ProfitMetricDto(
      value: (json['value'] as num?)?.toDouble(),
      comparisonLabel: json['comparisonLabel'] as String?,
      percentChange: (json['percentChange'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ProfitMetricDtoToJson(ProfitMetricDto instance) =>
    <String, dynamic>{
      'value': instance.value,
      'comparisonLabel': instance.comparisonLabel,
      'percentChange': instance.percentChange,
    };

ProfitPaymentBreakdownDto _$ProfitPaymentBreakdownDtoFromJson(
  Map<String, dynamic> json,
) => ProfitPaymentBreakdownDto(
  cash: (json['cash'] as num?)?.toDouble(),
  collectedCredit: (json['collectedCredit'] as num?)?.toDouble(),
  pendingCredit: (json['pendingCredit'] as num?)?.toDouble(),
);

Map<String, dynamic> _$ProfitPaymentBreakdownDtoToJson(
  ProfitPaymentBreakdownDto instance,
) => <String, dynamic>{
  'cash': instance.cash,
  'collectedCredit': instance.collectedCredit,
  'pendingCredit': instance.pendingCredit,
};

ProfitExpenseBreakdownDto _$ProfitExpenseBreakdownDtoFromJson(
  Map<String, dynamic> json,
) => ProfitExpenseBreakdownDto(
  category: json['category'] as String?,
  total: (json['total'] as num?)?.toDouble(),
  percent: (json['percent'] as num?)?.toDouble(),
);

Map<String, dynamic> _$ProfitExpenseBreakdownDtoToJson(
  ProfitExpenseBreakdownDto instance,
) => <String, dynamic>{
  'category': instance.category,
  'total': instance.total,
  'percent': instance.percent,
};
