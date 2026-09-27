class ExpensesMonthlyTrend {
  const ExpensesMonthlyTrend({
    this.storeId,
    this.year,
    this.currency,
    this.total = 0,
    this.chart = const [],
  });
  final int? storeId;
  final int? year;
  final String? currency;
  final double total;
  final List<ExpensesMonthlyTrendItem> chart;
}

class ExpensesMonthlyTrendItem {
  const ExpensesMonthlyTrendItem({
    this.label,
    this.month,
    this.from,
    this.to,
    this.total = 0,
  });
  final String? label;
  final String? month;
  final String? from;
  final String? to;
  final double total;
}
