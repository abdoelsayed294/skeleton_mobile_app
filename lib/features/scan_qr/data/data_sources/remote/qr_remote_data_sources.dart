import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/scan_qr/data/model/Qr_Response_Dto.dart';

abstract class QrRemoteDataSources {
  Future <ApiResult<QrResponseDto>> getQrStatus();
}