import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/scan_qr/domain/entity/qr_response.dart';

abstract class QrRepo {
  Future <ApiResult<QrResponse>> getQrStatus();
}