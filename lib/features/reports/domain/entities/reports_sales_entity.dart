class ReportsSalesEntity {
  final double totalSales;
  final double salesChangePct;
  final int orders;
  final double ordersChangePct;
  final double avgOrder;
  final int customers;

  ReportsSalesEntity({
    required this.totalSales,
    required this.salesChangePct,
    required this.orders,
    required this.ordersChangePct,
    required this.avgOrder,
    required this.customers,
  });
}
