class PurchasesSummaryEntity {
  final int? storeId;
  final int? year;
  final int? month;
  final String? monthLabel;
  final DateTime? from;
  final DateTime? to;
  final double totalPurchases;
  final double vsLastMonthPct;
  final double vsLastMonthTotal;
  final int orders;
  final int suppliers;

  const PurchasesSummaryEntity({
    this.storeId,
    this.year,
    this.month,
    this.monthLabel,
    this.from,
    this.to,
    required this.totalPurchases,
    required this.vsLastMonthPct,
    required this.vsLastMonthTotal,
    required this.orders,
    required this.suppliers,
  });
}
