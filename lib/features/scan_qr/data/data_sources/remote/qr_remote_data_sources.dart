import 'package:skeleton/core/networking/api_result.dart';
import 'package:skeleton/features/scan_qr/data/model/qr_response_dto.dart';

abstract class QrRemoteDataSources {
  Future<ApiResult<QrResponseDto>> getQrStatus(String token);
}
