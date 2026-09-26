import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/networking/api_error_handler.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/today_sales/data/data_source/remote/today_sales_remote_data_source.dart';
import 'package:skeleton_mobile_app/features/today_sales/data/mappers/today_recent_transaction_mapper.dart';
import 'package:skeleton_mobile_app/features/today_sales/data/mappers/today_sales_mapper.dart';
import 'package:skeleton_mobile_app/features/today_sales/domain/entities/today_recent_transaction_entity.dart';
import 'package:skeleton_mobile_app/features/today_sales/domain/entities/today_sales_entity.dart';
import 'package:skeleton_mobile_app/features/today_sales/domain/repo/today_sales_repo.dart';

@Injectable(as: TodaySalesRepo)
class TodaySalesRepoImpl extends TodaySalesRepo {
  final TodaySalesRemoteDataSource remoteDataSource;

  TodaySalesRepoImpl(this.remoteDataSource);

  @override
  Future<ApiResult<TodaySalesEntity>> getTodaySales(
    int storeId,
    DateTime date,
  ) async {
    final response = await remoteDataSource.getTodaySales(storeId, date);
    return response.when(
      success: (data) => ApiResult.success(data.toEntity()),
      failure: (error) => ApiResult.failure(ApiErrorHandler.handle(error)),
    );
  }

  @override
  Future<ApiResult<List<TodayRecentTransactionEntity>>> getRecentTransactions(
    int storeId,
    DateTime date,
    int take,
    bool all,
  ) async {
    final response = await remoteDataSource.getRecentTransactions(
      storeId,
      date,
      take,
      all,
    );
    return response.when(
      success: (data) =>
          ApiResult.success(data.map((e) => e.toEntity()).toList()),
      failure: (error) => ApiResult.failure(ApiErrorHandler.handle(error)),
    );
  }
}
