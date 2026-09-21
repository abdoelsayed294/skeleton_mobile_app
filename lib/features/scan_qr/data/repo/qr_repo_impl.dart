import 'package:skeleton_mobile_app/core/networking/api_error_handler.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/scan_qr/data/data_sources/remote/qr_remote_data_sources_impl.dart';
import 'package:skeleton_mobile_app/features/scan_qr/data/mappers/qr_mapper.dart';
import 'package:skeleton_mobile_app/features/scan_qr/domain/entity/qr_response.dart';
import 'package:skeleton_mobile_app/features/scan_qr/domain/repo/qr_repo.dart';

class QrRepoImpl implements QrRepo {
  final QrRemoteDataSourcesImpl _qrRemoteDataSourcesImpl;

  QrRepoImpl(this._qrRemoteDataSourcesImpl);

  @override
  Future<ApiResult<QrResponse>> getQrStatus(String token) async {
    final response = await _qrRemoteDataSourcesImpl.getQrStatus(token);

    return response.when(
      success: (data) {
        return ApiResult.success(
          data.toEntity(),
        );
      },
      failure: (error) {
        return ApiResult.failure(ApiErrorHandler.handle(error));
      },
    );
  }
}