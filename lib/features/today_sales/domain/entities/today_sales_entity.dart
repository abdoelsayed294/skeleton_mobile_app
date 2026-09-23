class TodaySalesEntity {
  final double totalSales;
  final double changePct;
  final int orders;
  final double avgOrder;
  final int itemsSold;
  final double itemsSoldChangePct;
  final double returnsTotal;
  final double returnsChangePct;

  TodaySalesEntity({
    required this.totalSales,
    required this.changePct,
    required this.orders,
    required this.avgOrder,
    required this.itemsSold,
    required this.itemsSoldChangePct,
    required this.returnsTotal,
    required this.returnsChangePct,
  });
}
