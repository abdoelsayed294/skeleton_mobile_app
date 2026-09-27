import 'dart:typed_data';

import 'package:skeleton_mobile_app/core/networking/api_result.dart';

abstract class ReportsExportRepository {
  Future<ApiResult<Uint8List>> exportSalesReport({
    required DateTime from,
    required DateTime to,
    required int storeId,
    required bool isArabic,
  });
}
