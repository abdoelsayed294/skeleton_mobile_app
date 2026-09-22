class SummaryResponse {
  final BusinessSummary businessSummary;
  final StoreSummary storeSummary;
  final double todaySales;
  final double salesChangePct;
  final double todayExpenses;
  final double expensesChangePct;
  final double todayPurchases;
  final double purchasesChangePct;
  final double netProfit;
  final double netProfitChangePct;

  SummaryResponse({
    required this.businessSummary,
    required this.storeSummary,
    required this.todaySales,
    required this.salesChangePct,
    required this.todayExpenses,
    required this.expensesChangePct,
    required this.todayPurchases,
    required this.purchasesChangePct,
    required this.netProfit,
    required this.netProfitChangePct,
  });
}

class BusinessSummary {
  final String businessName;
  final String? ownerName;

  BusinessSummary({required this.businessName, this.ownerName});
}

class StoreSummary {
  final String storeName;

  StoreSummary({required this.storeName});
}
