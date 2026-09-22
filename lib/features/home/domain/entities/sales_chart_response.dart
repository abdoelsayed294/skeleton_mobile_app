class SalesChartResponse {
  final String period;
  final double total;
  final double changePct;
  final String vsLabel;
  final List<ChartPoint> chart;

  SalesChartResponse({
    required this.period,
    required this.total,
    required this.changePct,
    required this.vsLabel,
    required this.chart,
  });
}

class ChartPoint {
  final String date;
  final double total;
  final int count;

  ChartPoint({required this.date, required this.total, required this.count});
}
