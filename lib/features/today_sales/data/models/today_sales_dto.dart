import 'package:json_annotation/json_annotation.dart';

part 'today_sales_dto.g.dart';

@JsonSerializable()
class TodaySalesDto {
  @JsonKey(defaultValue: 0.0)
  final double totalRevenue;
  @JsonKey(defaultValue: 0.0)
  final double changePct;
  @JsonKey(defaultValue: '')
  final String vsLabel;
  @JsonKey(defaultValue: 0)
  final int orders;
  @JsonKey(defaultValue: 0.0)
  final double avgOrder;
  @JsonKey(defaultValue: 0)
  final int itemsSold;
  @JsonKey(defaultValue: 0.0)
  final double itemsSoldChangePct;
  @JsonKey(defaultValue: 0.0)
  final double returnsTotal;
  @JsonKey(defaultValue: 0)
  final int returnsOrders;
  @JsonKey(defaultValue: 0.0)
  final double returnsChangePct;
  @JsonKey(defaultValue: '')
  final String date;

  TodaySalesDto({
    required this.totalRevenue,
    required this.changePct,
    required this.vsLabel,
    required this.orders,
    required this.avgOrder,
    required this.itemsSold,
    required this.itemsSoldChangePct,
    required this.returnsTotal,
    required this.returnsOrders,
    required this.returnsChangePct,
    required this.date,
  });

  factory TodaySalesDto.fromJson(Map<String, dynamic> json) =>
      _$TodaySalesDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TodaySalesDtoToJson(this);
}
