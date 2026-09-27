import 'package:json_annotation/json_annotation.dart';

part 'expenses_monthly_trend_dto.g.dart';

@JsonSerializable()
class ExpensesMonthlyTrendDto {
  final int? storeId;
  final int? year;
  final String? currency;
  final num? total;
  final List<ExpensesMonthlyTrendItemDto>? chart;
  const ExpensesMonthlyTrendDto({
    this.storeId,
    this.year,
    this.currency,
    this.total,
    this.chart,
  });
  factory ExpensesMonthlyTrendDto.fromJson(Map<String, dynamic> json) =>
      _$ExpensesMonthlyTrendDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ExpensesMonthlyTrendDtoToJson(this);
}

@JsonSerializable()
class ExpensesMonthlyTrendItemDto {
  final String? label;
  final String? month;
  final String? from;
  final String? to;
  final num? total;
  const ExpensesMonthlyTrendItemDto({
    this.label,
    this.month,
    this.from,
    this.to,
    this.total,
  });
  factory ExpensesMonthlyTrendItemDto.fromJson(Map<String, dynamic> json) =>
      _$ExpensesMonthlyTrendItemDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ExpensesMonthlyTrendItemDtoToJson(this);
}
