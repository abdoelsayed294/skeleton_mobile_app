class ProfitSummary {
  final String? period;
  final ProfitRange? range;
  final ProfitMetric? netProfit;
  final ProfitMetric? grossProfit;
  final ProfitMetric? margin;
  final ProfitMetric? revenue;
  final ProfitMetric? expenses;
  final double cogs;
  final double returnedLoss;
  final double damagedPaid;
  final ProfitPaymentBreakdown? paymentBreakdown;
  final List<ProfitExpenseBreakdown> expenseBreakdown;
  const ProfitSummary({
    this.period,
    this.range,
    this.netProfit,
    this.grossProfit,
    this.margin,
    this.revenue,
    this.expenses,
    this.cogs = 0,
    this.returnedLoss = 0,
    this.damagedPaid = 0,
    this.paymentBreakdown,
    this.expenseBreakdown = const [],
  });
}

class ProfitRange {
  final String? from;
  final String? to;
  const ProfitRange({this.from, this.to});
}

class ProfitMetric {
  final double value;
  final String? comparisonLabel;
  final double percentChange;
  const ProfitMetric({
    this.value = 0,
    this.comparisonLabel,
    this.percentChange = 0,
  });
}

class ProfitPaymentBreakdown {
  final double cash;
  final double collectedCredit;
  final double pendingCredit;
  const ProfitPaymentBreakdown({
    this.cash = 0,
    this.collectedCredit = 0,
    this.pendingCredit = 0,
  });
}

class ProfitExpenseBreakdown {
  final String? category;
  final double total;
  final double percent;
  const ProfitExpenseBreakdown({
    this.category,
    this.total = 0,
    this.percent = 0,
  });
}
