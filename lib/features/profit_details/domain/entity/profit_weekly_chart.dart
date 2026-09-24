class ProfitWeeklyChart {
  final ProfitChartRange? range;
  final List<ProfitWeeklyDay> days;
  final double weekTotal;
  const ProfitWeeklyChart({
    this.range,
    this.days = const [],
    this.weekTotal = 0,
  });
}

class ProfitChartRange {
  final String? from;
  final String? to;
  const ProfitChartRange({this.from, this.to});
}

class ProfitWeeklyDay {
  final String? date;
  final double revenue;
  final double netProfit;
  final double gross;
  final double cogs;
  final double expenses;
  const ProfitWeeklyDay({
    this.date,
    this.revenue = 0,
    this.netProfit = 0,
    this.gross = 0,
    this.cogs = 0,
    this.expenses = 0,
  });
}
