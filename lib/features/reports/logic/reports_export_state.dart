import 'dart:typed_data';

import 'package:skeleton_mobile_app/core/networking/api_error_model.dart';

sealed class ReportsExportState {
  const ReportsExportState();
}

class ReportsExportInitial extends ReportsExportState {
  const ReportsExportInitial();
}

class ReportsExportLoading extends ReportsExportState {
  const ReportsExportLoading();
}

class ReportsExportSuccess extends ReportsExportState {
  final Uint8List pdfBytes;

  const ReportsExportSuccess(this.pdfBytes);
}

class ReportsExportError extends ReportsExportState {
  final ApiErrorModel error;

  const ReportsExportError(this.error);
}
