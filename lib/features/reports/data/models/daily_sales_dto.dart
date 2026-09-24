import 'package:json_annotation/json_annotation.dart';

part 'daily_sales_dto.g.dart';

@JsonSerializable()
class DailySalesDto {
  final String date;
  final double revenue;

  const DailySalesDto({required this.date, required this.revenue});

  factory DailySalesDto.fromJson(Map<String, dynamic> json) =>
      _$DailySalesDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DailySalesDtoToJson(this);
}
