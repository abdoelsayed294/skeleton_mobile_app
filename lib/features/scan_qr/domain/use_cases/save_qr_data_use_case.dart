import 'package:injectable/injectable.dart';
import 'package:skeleton/core/helpers/shared_pref_helper.dart';
import 'package:skeleton/features/scan_qr/domain/entity/qr_response.dart';

@injectable
class SaveQrDataUseCase {
  Future<void> invoke(QrResponse qrResponse) async {
    final storeId = qrResponse.storeId;
    if (storeId != null) {
      await SharedPrefHelper.setData(SharedPrefHelper.storeIdKey, storeId);
    }

    final businessId = qrResponse.businessId;
    if (businessId != null) {
      await SharedPrefHelper.setData(
        SharedPrefHelper.businessIdKey,
        businessId,
      );
    }
    await SharedPrefHelper.setData(
      SharedPrefHelper.qrStatusKey,
      qrResponse.status!,
    );
  }
}
