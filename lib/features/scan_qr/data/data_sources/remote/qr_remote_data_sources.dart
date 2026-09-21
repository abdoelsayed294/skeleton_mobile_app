import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/scan_qr/data/model/qr_response_dto.dart';

abstract class QrRemoteDataSources {
  Future <ApiResult<QrResponseDto>> getQrStatus(String token);
}