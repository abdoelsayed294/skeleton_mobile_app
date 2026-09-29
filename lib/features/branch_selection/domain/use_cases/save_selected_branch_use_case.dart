import 'package:injectable/injectable.dart';
import 'package:skeleton/core/helpers/shared_pref_helper.dart';

@injectable
class SaveSelectedBranchUseCase {
  Future<void> invoke(int storeId, {String? businessName}) async {
    await SharedPrefHelper.setData(SharedPrefHelper.storeIdKey, storeId);
    final name = businessName?.trim();
    if (name != null && name.isNotEmpty) {
      await SharedPrefHelper.setData(SharedPrefHelper.businessNameKey, name);
    }
  }
}
