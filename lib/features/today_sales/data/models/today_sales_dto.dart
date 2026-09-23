import 'package:json_annotation/json_annotation.dart';

part 'today_sales_dto.g.dart';

@JsonSerializable()
class TodaySalesDto {
  final double totalRevenue;
  final double totalSales;
  final double changePct;
  final String vsLabel;
  final int orders;
  final double avgOrder;
  final int itemsSold;
  final double itemsSoldChangePct;
  final int skus;
  final double returnsTotal;
  final int returnsOrders;
  final double returnsChangePct;
  final String date;

  TodaySalesDto({
    required this.totalRevenue,
    required this.totalSales,
    required this.changePct,
    required this.vsLabel,
    required this.orders,
    required this.avgOrder,
    required this.itemsSold,
    required this.itemsSoldChangePct,
    required this.skus,
    required this.returnsTotal,
    required this.returnsOrders,
    required this.returnsChangePct,
    required this.date,
  });

  factory TodaySalesDto.fromJson(Map<String, dynamic> json) => _$TodaySalesDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TodaySalesDtoToJson(this);
}
