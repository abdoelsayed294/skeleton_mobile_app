import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:skeleton_mobile_app/core/networking/api_constants.dart';
import 'package:skeleton_mobile_app/features/scan_qr/data/model/qr_response_dto.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) = _ApiService;
  @GET(EndPoints.qrStatus)
  Future<QrResponseDto> getQrStatus(
  @Path('qrToken') String token,
  );
}
