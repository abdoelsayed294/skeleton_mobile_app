import 'dart:typed_data';

import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/reports/data/data_source/remote/reports_export_remote_data_source.dart';
import 'package:skeleton_mobile_app/features/reports/domain/repo/reports_export_repository.dart';

@Injectable(as: ReportsExportRepository)
class ReportsExportRepositoryImpl implements ReportsExportRepository {
  final ReportsExportRemoteDataSource _remoteDataSource;

  ReportsExportRepositoryImpl(this._remoteDataSource);

  @override
  Future<ApiResult<Uint8List>> exportSalesReport({
    required DateTime from,
    required DateTime to,
    required int storeId,
    required bool isArabic,
  }) {
    return _remoteDataSource.exportSalesReport(
      from: from,
      to: to,
      storeId: storeId,
      isArabic: isArabic,
    );
  }
}
