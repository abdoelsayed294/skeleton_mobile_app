
import 'package:json_annotation/json_annotation.dart';

part 'sales_chart_dto.g.dart';

@JsonSerializable()
class SalesChartDto {
  final DateTime? date;
  final double? total;
  final int? count;

  SalesChartDto({
    this.date,
    this.total,
    this.count,
  });

  factory SalesChartDto.fromJson(Map<String, dynamic> json) =>
      _$SalesChartDtoFromJson(json);
  
  Map<String, dynamic> toJson() => _$SalesChartDtoToJson(this);
}