class ExpensesSummary {
  const ExpensesSummary({
    this.storeId,
    this.period,
    this.periodLabel,
    this.currency,
    this.range,
    this.totalExpenses = 0,
    this.pct = 0,
    this.vsLabel,
    this.vsTotal = 0,
    this.transactions = 0,
    this.avgPerTx = 0,
    this.dailyAvg = 0,
    this.highest,
    this.lowest,
  });
  final int? storeId;
  final String? period;
  final String? periodLabel;
  final String? currency;
  final ExpenseDateRange? range;
  final double totalExpenses;
  final double pct;
  final String? vsLabel;
  final double vsTotal;
  final int transactions;
  final double avgPerTx;
  final double dailyAvg;
  final ExpenseSummaryEntry? highest;
  final ExpenseSummaryEntry? lowest;
}

class ExpenseDateRange {
  const ExpenseDateRange({this.from, this.to});
  final String? from;
  final String? to;
}

class ExpenseSummaryEntry {
  const ExpenseSummaryEntry({
    this.id,
    this.value = 0,
    this.type,
    this.statement,
    this.day,
    this.dayFormatted,
  });
  final int? id;
  final double value;
  final String? type;
  final String? statement;
  final String? day;
  final String? dayFormatted;
}
