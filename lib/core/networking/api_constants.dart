class ApiConstants {
  static const String baseUrl = 'http://skeleton.runasp.net';
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}

class EndPoints {
  static const String qrStatus = '/api/business/qr/status/{qrToken}';
  static const String dashboardSummary = '/api/Dashboard/summary/';
  static const String dashboardSalesChart = '/api/Dashboard/sales-chart/';
  static const String dashboardTopProducts = '/api/Dashboard/top-products';
  static const String dashboardLowStock = '/api/Dashboard/low-stock-detail/';
  static const String reportsTopSelling = '/api/reports/top-selling';
  static const String reportsSales = '/api/reports/sales';
  static const String reportsRecentTransactions =
      '/api/reports/recent-transactions';
  static const String inventorySummary = '/api/inventory/summary';
  static const String inventoryProducts = '/api/inventory/products';

  static const String todaySales = '/api/today-sales';
  static const String todaySalesRecentTransactions =
      '/api/today-sales/recent-transactions';
  static const String profitSummary = '/api/dashboard/profit-summary';
  static const String profitWeeklyChart = '/api/dashboard/profit-weekly-chart';
  static const String purchasesSummary = '/api/Purchases/summary';
  static const String purchasesRecent = '/api/Purchases/recent';
  static const String productActivity = '/api/Products/{id}/activity';
  static const String productHeader = '/api/Products/{id}/header';
  static const String productPricing = '/api/Products/{id}/pricing';
  static const String productInventory = '/api/Products/{id}/inventory';
  static const String productSalesHistory = '/api/Products/{id}/sales-history';
}
