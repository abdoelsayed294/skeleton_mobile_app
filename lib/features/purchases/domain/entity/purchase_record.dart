class PurchaseRecordEntity {
  final int id;
  final String? supplier;
  final DateTime? date;
  final String? monthLabel;
  final String? invoiceNumber;
  final String? status;
  final double total;
  final double paid;
  final double remaining;
  final DateTime? dueDate;

  const PurchaseRecordEntity({
    required this.id,
    this.supplier,
    this.date,
    this.monthLabel,
    this.invoiceNumber,
    this.status,
    required this.total,
    required this.paid,
    required this.remaining,
    this.dueDate,
  });
}
