import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/scan_qr/domain/entity/qr_response.dart';
import 'package:skeleton_mobile_app/features/scan_qr/domain/repo/qr_repo.dart';

@injectable
class QrUseCase {
  final QrRepo _qrRepo;

  QrUseCase(this._qrRepo);

  Future<ApiResult<QrResponse>> invoke(String token) async {
    return await _qrRepo.getQrStatus(token);
  }
}