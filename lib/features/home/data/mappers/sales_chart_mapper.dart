import 'package:skeleton_mobile_app/features/home/data/models/sales_chart_response_dto.dart';
import 'package:skeleton_mobile_app/features/home/domain/entities/sales_chart_response.dart';

extension DashboardSalesChartMapper on SalesChartResponseDto {
  SalesChartResponse toEntity() {
    return SalesChartResponse(
      period: period,
      total: total,
      changePct: changePct,
      vsLabel: vsLabel,
      chart: chart.map((e) => e.toEntity()).toList()
    );
  }
}

extension ChartPointMapper on ChartPointDto {
  ChartPoint toEntity() {
    return ChartPoint(date: date, total: total, count: count);
  }
}
