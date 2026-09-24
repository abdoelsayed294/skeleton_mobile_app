import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/networking/api_error_handler.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/core/networking/api_service.dart';
import 'package:skeleton_mobile_app/features/reports/data/data_source/remote/recent_transaction_remote_data_source.dart';
import 'package:skeleton_mobile_app/features/reports/data/models/recent_transaction_dto.dart';

@Injectable(as: RecentTransactionRemoteDataSource)
class RecentTransactionRemoteDataSourceImpl
    extends RecentTransactionRemoteDataSource {
  final ApiService apiService;

  RecentTransactionRemoteDataSourceImpl(this.apiService);

  @override
  Future<ApiResult<List<RecentTransactionDto>>> getRecentTransactions(
    int storeId,
    String period,
    int take,
    int year,
    int month,
  ) async {
    try {
      final response = await apiService.getRecentTransactions(
        take,
        period,
        storeId,
        year,
        month,
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
