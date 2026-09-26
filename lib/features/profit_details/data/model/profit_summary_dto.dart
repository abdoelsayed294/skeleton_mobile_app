import 'package:json_annotation/json_annotation.dart';

part 'profit_summary_dto.g.dart';

@JsonSerializable()
class ProfitSummaryDto {
  @JsonKey(name: 'period')
  final String? period;
  @JsonKey(name: 'range')
  final ProfitRangeDto? range;
  @JsonKey(name: 'netProfit')
  final ProfitMetricDto? netProfit;
  @JsonKey(name: 'grossProfit')
  final ProfitMetricDto? grossProfit;
  @JsonKey(name: 'margin')
  final ProfitMetricDto? margin;
  @JsonKey(name: 'revenue')
  final ProfitMetricDto? revenue;
  @JsonKey(name: 'revenuePaid')
  final ProfitMetricDto? revenuePaid;
  @JsonKey(name: 'expenses')
  final ProfitMetricDto? expenses;
  @JsonKey(name: 'cogs')
  final double? cogs;
  @JsonKey(name: 'returnedLoss')
  final double? returnedLoss;
  @JsonKey(name: 'damagedPaid')
  final double? damagedPaid;
  @JsonKey(name: 'profitBreakdownByPayment')
  final ProfitPaymentBreakdownDto? profitBreakdownByPayment;
  @JsonKey(name: 'expenseBreakdown')
  final List<ProfitExpenseBreakdownDto>? expenseBreakdown;

  ProfitSummaryDto({
    this.period,
    this.range,
    this.netProfit,
    this.grossProfit,
    this.margin,
    this.revenue,
    this.revenuePaid,
    this.expenses,
    this.cogs,
    this.returnedLoss,
    this.damagedPaid,
    this.profitBreakdownByPayment,
    this.expenseBreakdown,
  });

  factory ProfitSummaryDto.fromJson(Map<String, dynamic> json) =>
      _$ProfitSummaryDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ProfitSummaryDtoToJson(this);
}

@JsonSerializable()
class ProfitRangeDto {
  @JsonKey(name: 'from')
  final String? from;
  @JsonKey(name: 'to')
  final String? to;

  ProfitRangeDto({this.from, this.to});

  factory ProfitRangeDto.fromJson(Map<String, dynamic> json) =>
      _$ProfitRangeDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ProfitRangeDtoToJson(this);
}

@JsonSerializable()
class ProfitMetricDto {
  @JsonKey(name: 'value')
  final double? value;
  @JsonKey(name: 'comparisonLabel')
  final String? comparisonLabel;
  @JsonKey(name: 'percentChange')
  final double? percentChange;

  ProfitMetricDto({this.value, this.comparisonLabel, this.percentChange});

  factory ProfitMetricDto.fromJson(Map<String, dynamic> json) =>
      _$ProfitMetricDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ProfitMetricDtoToJson(this);
}

@JsonSerializable()
class ProfitPaymentBreakdownDto {
  @JsonKey(name: 'cash')
  final double? cash;
  @JsonKey(name: 'collectedCredit')
  final double? collectedCredit;
  @JsonKey(name: 'pendingCredit')
  final double? pendingCredit;

  ProfitPaymentBreakdownDto({
    this.cash,
    this.collectedCredit,
    this.pendingCredit,
  });

  factory ProfitPaymentBreakdownDto.fromJson(Map<String, dynamic> json) =>
      _$ProfitPaymentBreakdownDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ProfitPaymentBreakdownDtoToJson(this);
}

@JsonSerializable()
class ProfitExpenseBreakdownDto {
  @JsonKey(name: 'category')
  final String? category;
  @JsonKey(name: 'total')
  final double? total;
  @JsonKey(name: 'percent')
  final double? percent;

  ProfitExpenseBreakdownDto({this.category, this.total, this.percent});

  factory ProfitExpenseBreakdownDto.fromJson(Map<String, dynamic> json) =>
      _$ProfitExpenseBreakdownDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ProfitExpenseBreakdownDtoToJson(this);
}
