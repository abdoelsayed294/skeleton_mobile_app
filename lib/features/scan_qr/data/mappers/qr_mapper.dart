import 'package:skeleton_mobile_app/features/scan_qr/data/model/qr_response_dto.dart';
import 'package:skeleton_mobile_app/features/scan_qr/domain/entity/qr_response.dart';

extension QrResponseDtoMapper on QrResponseDto {
  QrResponse toEntity() {
    return QrResponse(
      status: status,
      storeId: store?.id,
      businessId: store?.businessID ?? business?.id,
      message: message,
    );
  }
}