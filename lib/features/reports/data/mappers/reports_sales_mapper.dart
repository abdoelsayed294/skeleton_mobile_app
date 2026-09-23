import 'package:skeleton_mobile_app/features/reports/data/models/reports_sales_dto.dart';
import 'package:skeleton_mobile_app/features/reports/domain/entities/reports_sales_entity.dart';

extension ReportsSalesMapper on ReportsSalesDto {
  ReportsSalesEntity toEntity() {
    return ReportsSalesEntity(
      totalSales: totalSales,
      salesChangePct: salesChangePct,
      orders: orders,
      ordersChangePct: ordersChangePct,
      avgOrder: avgOrder,
      customers: customers,
    );
  }
}
