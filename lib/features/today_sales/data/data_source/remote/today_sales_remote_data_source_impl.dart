import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/networking/api_error_handler.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/core/networking/api_service.dart';
import 'package:skeleton_mobile_app/features/today_sales/data/data_source/remote/today_sales_remote_data_source.dart';
import 'package:skeleton_mobile_app/features/today_sales/data/models/today_recent_transaction_dto.dart';
import 'package:skeleton_mobile_app/features/today_sales/data/models/today_sales_dto.dart';

@Injectable(as: TodaySalesRemoteDataSource)
class TodaySalesRemoteDataSourceImpl extends TodaySalesRemoteDataSource {
  final ApiService apiService;

  TodaySalesRemoteDataSourceImpl(this.apiService);

  @override
  Future<ApiResult<TodaySalesDto>> getTodaySales(int storeId) async {
    try {
      final response = await apiService.getTodaySales(storeId);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResult<List<TodayRecentTransactionDto>>> getRecentTransactions(int storeId, String period, int take) async {
    try {
      final response = await apiService.getTodaySalesRecentTransactions(take, period, storeId);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
