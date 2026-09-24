import 'package:json_annotation/json_annotation.dart';

part 'profit_weekly_chart_dto.g.dart';

@JsonSerializable()
class ProfitWeeklyChartDto {
  @JsonKey(name: 'range')
  final ProfitChartRangeDto? range;
  @JsonKey(name: 'weeklyProfitSummary')
  final List<ProfitWeeklyDayDto>? weeklyProfitSummary;
  @JsonKey(name: 'weekTotal')
  final double? weekTotal;

  ProfitWeeklyChartDto({this.range, this.weeklyProfitSummary, this.weekTotal});

  factory ProfitWeeklyChartDto.fromJson(Map<String, dynamic> json) =>
      _$ProfitWeeklyChartDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ProfitWeeklyChartDtoToJson(this);
}

@JsonSerializable()
class ProfitChartRangeDto {
  @JsonKey(name: 'from')
  final String? from;
  @JsonKey(name: 'to')
  final String? to;

  ProfitChartRangeDto({this.from, this.to});

  factory ProfitChartRangeDto.fromJson(Map<String, dynamic> json) =>
      _$ProfitChartRangeDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ProfitChartRangeDtoToJson(this);
}

@JsonSerializable()
class ProfitWeeklyDayDto {
  @JsonKey(name: 'date')
  final String? date;
  @JsonKey(name: 'revenue')
  final double? revenue;
  @JsonKey(name: 'netProfit')
  final double? netProfit;
  @JsonKey(name: 'gross')
  final double? gross;
  @JsonKey(name: 'cogs')
  final double? cogs;
  @JsonKey(name: 'expenses')
  final double? expenses;

  ProfitWeeklyDayDto({
    this.date,
    this.revenue,
    this.netProfit,
    this.gross,
    this.cogs,
    this.expenses,
  });

  factory ProfitWeeklyDayDto.fromJson(Map<String, dynamic> json) =>
      _$ProfitWeeklyDayDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ProfitWeeklyDayDtoToJson(this);
}
