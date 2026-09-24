import 'package:skeleton_mobile_app/features/reports/data/models/reports_sales_dto.dart';
import 'package:skeleton_mobile_app/features/reports/domain/entities/reports_sales_entity.dart';
import 'package:skeleton_mobile_app/features/reports/domain/entities/daily_sales_entity.dart';
import 'package:skeleton_mobile_app/features/reports/domain/entities/payment_breakdown_entity.dart';
import 'package:skeleton_mobile_app/features/reports/data/mappers/top_selling_mapper.dart';

extension ReportsSalesMapper on ReportsSalesDto {
  ReportsSalesEntity toEntity() {
    return ReportsSalesEntity(
      period: period,
      from: DateTime.tryParse(from),
      to: DateTime.tryParse(to),
      totalSales: totalSales,
      salesChangePct: salesChangePct,
      orders: orders,
      ordersChangePct: ordersChangePct,
      avgOrder: avgOrder,
      customers: customers,
      daily: daily
          .map(
            (point) => DailySalesEntity(
              date: DateTime.tryParse(point.date),
              revenue: point.revenue,
            ),
          )
          .toList(),
      breakdown: breakdown
          .map(
            (item) => PaymentBreakdownEntity(
              method: item.method,
              percent: item.percent,
              count: item.count,
            ),
          )
          .toList(),
      topSelling: topSelling.map((item) => item.toEntity()).toList(),
    );
  }
}
