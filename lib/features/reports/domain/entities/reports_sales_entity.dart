import 'package:skeleton_mobile_app/features/reports/domain/entities/daily_sales_entity.dart';
import 'package:skeleton_mobile_app/features/reports/domain/entities/payment_breakdown_entity.dart';
import 'package:skeleton_mobile_app/features/reports/domain/entities/top_selling_entity.dart';

class ReportsSalesEntity {
  final String period;
  final DateTime? from;
  final DateTime? to;
  final double totalSales;
  final double salesChangePct;
  final int orders;
  final double ordersChangePct;
  final double avgOrder;
  final int customers;
  final List<DailySalesEntity> daily;
  final List<PaymentBreakdownEntity> breakdown;
  final List<TopSellingEntity> topSelling;

  ReportsSalesEntity({
    required this.totalSales,
    required this.salesChangePct,
    required this.orders,
    required this.ordersChangePct,
    required this.avgOrder,
    required this.customers,
    this.period = 'month',
    this.from,
    this.to,
    this.daily = const [],
    this.breakdown = const [],
    this.topSelling = const [],
  });
}
