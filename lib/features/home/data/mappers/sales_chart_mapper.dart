import 'package:skeleton_mobile_app/features/home/data/models/sales_chart_dto.dart';
import 'package:skeleton_mobile_app/features/home/domain/entities/sales_chart_entity.dart';

extension DashboardSalesChartMapper on SalesChartDto {
  SalesChartEntity toEntity() {
    return SalesChartEntity(date: date, total: total, count: count);
  }
}
