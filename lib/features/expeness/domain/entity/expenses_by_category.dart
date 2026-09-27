class ExpensesByCategory {
  const ExpensesByCategory({
    this.storeId,
    this.period,
    this.periodLabel,
    this.currency,
    this.range,
    this.total = 0,
    this.categoriesCount = 0,
    this.categories = const [],
  });
  final int? storeId;
  final String? period;
  final String? periodLabel;
  final String? currency;
  final ExpenseCategoryRange? range;
  final double total;
  final int categoriesCount;
  final List<ExpenseCategoryItem> categories;
}

class ExpenseCategoryRange {
  const ExpenseCategoryRange({this.from, this.to});
  final String? from;
  final String? to;
}

class ExpenseCategoryItem {
  const ExpenseCategoryItem({
    this.category,
    this.total = 0,
    this.percent = 0,
    this.transactions = 0,
  });
  final String? category;
  final double total;
  final double percent;
  final int transactions;
}
