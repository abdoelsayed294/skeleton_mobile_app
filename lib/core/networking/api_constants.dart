class ApiConstants {
    static const String baseUrl = 'https://overfull-container-skiing.ngrok-free.dev/';


  
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
  static const String dashboardTopProducts = '/api/Dashboard/top-products/';
  static const String dashboardLowStock = '/api/Dashboard/low-stock-detail/';

  
}