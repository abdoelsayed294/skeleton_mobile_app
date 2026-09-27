class ExpensesPeakDays {
  const ExpensesPeakDays({
    this.storeId,
    this.currency,
    this.count = 0,
    this.items = const [],
  });
  final int? storeId;
  final String? currency;
  final int count;
  final List<ExpensesPeakDayItem> items;
}

class ExpensesPeakDayItem {
  const ExpensesPeakDayItem({
    this.day,
    this.dayFormatted,
    this.total = 0,
    this.transactions = 0,
  });
  final String? day;
  final String? dayFormatted;
  final double total;
  final int transactions;
}
