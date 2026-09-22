
import 'package:json_annotation/json_annotation.dart';

part 'sales_chart_response_dto.g.dart';

@JsonSerializable()
class SalesChartResponseDto {
  @JsonKey(name: 'period')
  final String period;
  @JsonKey(name: 'totalRevenue')
  final double total;
  @JsonKey(name: 'changePct')
  final double changePct;
  @JsonKey(name: 'vsLabel')
  final String vsLabel;
  @JsonKey(name: 'chart')
  final List<ChartPointDto> chart;

  SalesChartResponseDto({
    required this.period,
    required this.total,
    required this.changePct,
    required this.vsLabel,
    required this.chart,
  });

  factory SalesChartResponseDto.fromJson(Map<String, dynamic> json) =>
      _$SalesChartResponseDtoFromJson(json);
  
  Map<String, dynamic> toJson() => _$SalesChartResponseDtoToJson(this);

}


@JsonSerializable()
class ChartPointDto {
  @JsonKey(name: 'date')
  final String date;
  @JsonKey(name: 'total')
  final double total;
  @JsonKey(name: 'count', defaultValue: 0)
  final int count;

  ChartPointDto({
    required this.date,
    required this.total,
    required this.count,
  });

  factory ChartPointDto.fromJson(Map<String, dynamic> json) =>
      _$ChartPointDtoFromJson(json);
  
  Map<String, dynamic> toJson() => _$ChartPointDtoToJson(this);
}