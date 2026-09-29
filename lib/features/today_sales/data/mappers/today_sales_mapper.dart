import 'package:skeleton/features/today_sales/data/models/today_sales_dto.dart';
import 'package:skeleton/features/today_sales/domain/entities/today_sales_entity.dart';

extension TodaySalesMapper on TodaySalesDto {
  TodaySalesEntity toEntity() {
    return TodaySalesEntity(
      totalSales: totalRevenue,
      changePct: changePct,
      vsLabel: vsLabel,
      orders: orders,
      avgOrder: avgOrder,
      itemsSold: itemsSold,
      itemsSoldChangePct: itemsSoldChangePct,
      returnsTotal: returnsTotal,
      returnsOrders: returnsOrders,
      returnsChangePct: returnsChangePct,
    );
  }
}
