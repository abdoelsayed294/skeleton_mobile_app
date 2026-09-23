import 'package:json_annotation/json_annotation.dart';

part 'reports_sales_dto.g.dart';

@JsonSerializable()
class ReportsSalesDto {
  final String period;
  final String from;
  final String to;
  final double totalSales;
  final double salesChangePct;
  final int orders;
  final double ordersChangePct;
  final double avgOrder;
  final int customers;

  ReportsSalesDto({
    required this.period,
    required this.from,
    required this.to,
    required this.totalSales,
    required this.salesChangePct,
    required this.orders,
    required this.ordersChangePct,
    required this.avgOrder,
    required this.customers,
  });

  factory ReportsSalesDto.fromJson(Map<String, dynamic> json) =>
      _$ReportsSalesDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ReportsSalesDtoToJson(this);
}
