import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/helpers/shared_pref_helper.dart';
import 'package:skeleton_mobile_app/features/scan_qr/domain/entity/qr_response.dart';

@injectable
class SaveQrDataUseCase {
  Future<void> invoke(QrResponse qrResponse) async {
    await SharedPrefHelper.setData(
      SharedPrefHelper.storeIdKey,
      qrResponse.storeId!,
    );

    await SharedPrefHelper.setData(
      SharedPrefHelper.businessIdKey,
      qrResponse.businessId!,
    );
       await SharedPrefHelper.setData(
      SharedPrefHelper.qrStatusKey,
      qrResponse.status!,
    );
  }
}