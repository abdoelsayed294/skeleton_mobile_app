import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/networking/api_error_handler.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/core/networking/api_service.dart';
import 'package:skeleton_mobile_app/features/scan_qr/data/data_sources/remote/qr_remote_data_sources.dart';
import 'package:skeleton_mobile_app/features/scan_qr/data/model/qr_response_dto.dart';
@Injectable(as: QrRemoteDataSources)
class QrRemoteDataSourcesImpl implements QrRemoteDataSources {
  final ApiService _apiService;
  QrRemoteDataSourcesImpl(this._apiService);
@override
  Future<ApiResult<QrResponseDto>> getQrStatus(String token) async {
    try {
      final response =await _apiService.getQrStatus(token);
      return ApiResult.success(response);
    }
catch(e){
      return ApiResult.failure(ApiErrorHandler.handle(e));
}
  }
  
}
