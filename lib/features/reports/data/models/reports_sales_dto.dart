import 'package:json_annotation/json_annotation.dart';
import 'package:skeleton_mobile_app/features/reports/data/models/top_selling_dto.dart';
import 'package:skeleton_mobile_app/features/reports/data/models/daily_sales_dto.dart';
import 'package:skeleton_mobile_app/features/reports/data/models/payment_breakdown_dto.dart';

part 'reports_sales_dto.g.dart';

@JsonSerializable()
class ReportsSalesDto {
  final String period;
  final String from;
  final String to;
  final double totalSales;
  final double salesChangePct;
  final int orders;
  @JsonKey(defaultValue: 0)
  final double ordersChangePct;
  final double avgOrder;
  final int customers;
  @JsonKey(defaultValue: <DailySalesDto>[])
  final List<DailySalesDto> daily;
  @JsonKey(defaultValue: <PaymentBreakdownDto>[])
  final List<PaymentBreakdownDto> breakdown;
  @JsonKey(defaultValue: <TopSellingDto>[])
  final List<TopSellingDto> topSelling;

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
    this.daily = const [],
    this.breakdown = const [],
    this.topSelling = const [],
  });

  factory ReportsSalesDto.fromJson(Map<String, dynamic> json) =>
      _$ReportsSalesDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ReportsSalesDtoToJson(this);
}
