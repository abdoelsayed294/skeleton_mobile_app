enum TransactionKind { cash, card, wallet }

class RecentTransactionEntity {
  final String orderId;
  final String time;
  final String paymentMethod;
  final TransactionKind kind;
  final double amount;

  RecentTransactionEntity({
    required this.orderId,
    required this.time,
    required this.paymentMethod,
    required this.kind,
    required this.amount,
  });
}
