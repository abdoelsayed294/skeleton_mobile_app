import 'package:json_annotation/json_annotation.dart';

part 'expenses_summary_dto.g.dart';

@JsonSerializable()
class ExpensesSummaryDto {
  final int? storeId;
  final String? period;
  final String? periodLabel;
  final String? currency;
  final ExpenseDateRangeDto? range;
  final num? totalExpenses;
  final num? pct;
  final String? vsLabel;
  final num? vsTotal;
  final int? transactions;
  final num? avgPerTx;
  final num? dailyAvg;
  final ExpenseSummaryEntryDto? highest;
  final ExpenseSummaryEntryDto? lowest;
  const ExpensesSummaryDto({
    this.storeId,
    this.period,
    this.periodLabel,
    this.currency,
    this.range,
    this.totalExpenses,
    this.pct,
    this.vsLabel,
    this.vsTotal,
    this.transactions,
    this.avgPerTx,
    this.dailyAvg,
    this.highest,
    this.lowest,
  });
  factory ExpensesSummaryDto.fromJson(Map<String, dynamic> json) =>
      _$ExpensesSummaryDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ExpensesSummaryDtoToJson(this);
}

@JsonSerializable()
class ExpenseDateRangeDto {
  final String? from;
  final String? to;
  const ExpenseDateRangeDto({this.from, this.to});
  factory ExpenseDateRangeDto.fromJson(Map<String, dynamic> json) =>
      _$ExpenseDateRangeDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ExpenseDateRangeDtoToJson(this);
}

@JsonSerializable()
class ExpenseSummaryEntryDto {
  final int? id;
  final num? value;
  final String? type;
  final String? statement;
  final String? day;
  final String? dayFormatted;
  const ExpenseSummaryEntryDto({
    this.id,
    this.value,
    this.type,
    this.statement,
    this.day,
    this.dayFormatted,
  });
  factory ExpenseSummaryEntryDto.fromJson(Map<String, dynamic> json) =>
      _$ExpenseSummaryEntryDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ExpenseSummaryEntryDtoToJson(this);
}
