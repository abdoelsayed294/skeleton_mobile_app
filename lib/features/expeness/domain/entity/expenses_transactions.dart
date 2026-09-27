class ExpensesTransactions {
  const ExpensesTransactions({
    this.storeId,
    this.sort,
    this.currency,
    this.totalCount = 0,
    this.count = 0,
    this.items = const [],
    this.isLoadingMore = false,
  });
  final int? storeId;
  final String? sort;
  final String? currency;
  final int totalCount;
  final int count;
  final List<ExpensesTransactionItem> items;
  final bool isLoadingMore;
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
