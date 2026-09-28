class ExpensesTransactions {
  const ExpensesTransactions({
    this.storeId,
    this.sort,
    this.date,
    this.period,
    this.range,
    this.currency,
    this.totalCount = 0,
    this.count = 0,
    this.items = const [],
    this.isLoadingMore = false,
  });
  final int? storeId;
  final String? sort;
  final String? date;
  final String? period;
  final ExpenseTransactionsRange? range;
  final String? currency;
  final int totalCount;
  final int count;
  final List<ExpensesTransactionItem> items;
  final bool isLoadingMore;
}

class ExpenseTransactionsRange {
  const ExpenseTransactionsRange({this.from, this.to});

  final String? from;
  final String? to;
}

class ExpensesTransactionItem {
  const ExpensesTransactionItem({
    this.id,
    this.title,
    this.type,
    this.day,
    this.dayFormatted,
    this.value = 0,
    this.notes,
  });
  final int? id;
  final String? title;
  final String? type;
  final String? day;
  final String? dayFormatted;
  final double value;
  final String? notes;
}
