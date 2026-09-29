import 'package:skeleton/core/networking/api_result.dart';
import 'package:skeleton/features/scan_qr/domain/entity/qr_response.dart';

abstract class QrRepo {
  Future<ApiResult<QrResponse>> getQrStatus(String token);
}
