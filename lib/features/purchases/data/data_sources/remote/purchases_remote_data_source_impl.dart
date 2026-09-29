import 'package:injectable/injectable.dart';
import 'package:skeleton/core/networking/api_error_handler.dart';
import 'package:skeleton/core/networking/api_result.dart';
import 'package:skeleton/core/networking/api_service.dart';
import 'package:skeleton/features/purchases/data/data_sources/remote/purchases_remote_data_source.dart';
import 'package:skeleton/features/purchases/data/model/purchases_dto.dart';

@Injectable(as: PurchasesRemoteDataSource)
class PurchasesRemoteDataSourceImpl implements PurchasesRemoteDataSource {
  final ApiService _apiService;

  PurchasesRemoteDataSourceImpl(this._apiService);

  @override
  Future<ApiResult<PurchasesSummaryDto>> getPurchasesSummary(
    int storeId,
    String date,
  ) async {
    try {
      return ApiResult.success(
        await _apiService.getPurchasesSummary(storeId, date),
      );
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<PurchasesRecentDto>> getPurchasesRecent(
    int storeId,
    String date,
    int take,
  ) async {
    try {
      return ApiResult.success(
        await _apiService.getPurchasesRecent(storeId, date, take),
      );
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
