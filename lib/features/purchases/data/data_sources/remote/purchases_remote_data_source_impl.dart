import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/networking/api_error_handler.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/core/networking/api_service.dart';
import 'package:skeleton_mobile_app/features/purchases/data/data_sources/remote/purchases_remote_data_source.dart';
import 'package:skeleton_mobile_app/features/purchases/data/model/purchases_dto.dart';

@Injectable(as: PurchasesRemoteDataSource)
class PurchasesRemoteDataSourceImpl implements PurchasesRemoteDataSource {
  final ApiService _apiService;

  PurchasesRemoteDataSourceImpl(this._apiService);

  @override
  Future<ApiResult<PurchasesSummaryDto>> getPurchasesSummary(
    int storeId,
    int year,
    int month,
  ) async {
    try {
      return ApiResult.success(
        await _apiService.getPurchasesSummary(storeId, year, month),
      );
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<PurchasesRecentDto>> getPurchasesRecent(
    int storeId,
    int year,
    int month,
    int take,
  ) async {
    try {
      return ApiResult.success(
        await _apiService.getPurchasesRecent(storeId, year, month, take),
      );
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
