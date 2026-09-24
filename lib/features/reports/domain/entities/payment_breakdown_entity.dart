class PaymentBreakdownEntity {
  final String method;
  final double percent;
  final int count;

  const PaymentBreakdownEntity({
    required this.method,
    required this.percent,
    required this.count,
  });
}
