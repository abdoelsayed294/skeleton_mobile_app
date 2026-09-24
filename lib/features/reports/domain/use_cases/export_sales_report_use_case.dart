import 'dart:typed_data';

import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/reports/domain/repo/reports_export_repository.dart';

@injectable
class ExportSalesReportUseCase {
  final ReportsExportRepository _repository;

  ExportSalesReportUseCase(this._repository);

  Future<ApiResult<Uint8List>> invoke({
    required DateTime from,
    required DateTime to,
    required int storeId,
    required bool isArabic,
  }) {
    return _repository.exportSalesReport(
      from: from,
      to: to,
      storeId: storeId,
      isArabic: isArabic,
    );
  }
}
