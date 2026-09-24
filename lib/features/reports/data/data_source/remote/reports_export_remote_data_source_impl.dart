import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:skeleton_mobile_app/core/networking/api_constants.dart';
import 'package:skeleton_mobile_app/core/networking/api_error_handler.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/reports/data/data_source/remote/reports_export_remote_data_source.dart';

@Injectable(as: ReportsExportRemoteDataSource)
class ReportsExportRemoteDataSourceImpl
    implements ReportsExportRemoteDataSource {
  final Dio _dio;

  ReportsExportRemoteDataSourceImpl(this._dio);

  @override
  Future<ApiResult<Uint8List>> exportSalesReport({
    required DateTime from,
    required DateTime to,
    required int storeId,
    required bool isArabic,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '${ApiConstants.baseUrl}/api/reports/sales/export',
        queryParameters: {
          'from': from.toIso8601String(),
          'to': to.toIso8601String(),
          'period': 'month',
          'storeId': storeId,
          'format': 'pdf',
        },
      );
      final report = response.data;
      if (report == null || report.isEmpty) {
        throw const FormatException('The server returned an empty report.');
      }

      return ApiResult.success(await _createPdf(report, isArabic: isArabic));
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<Uint8List> _createPdf(
    Map<String, dynamic> report, {
    required bool isArabic,
  }) async {
    final fontData = await rootBundle.load(
      'assets/fonts/NotoSansArabic-Regular.ttf',
    );
    final arabicFont = pw.Font.ttf(fontData);
    final printPayload = _asMap(report['printPayload']);
    final summary = _asMap(report['summary']);
    final profit = _asMap(report['profit']);
    final document = pw.Document();

    String value(String key) {
      final raw = printPayload[key] ?? profit[key] ?? summary[key] ?? 0;
      return raw.toString();
    }

    final rows = <List<String>>[
      [_label('sales', isArabic), value('sales')],
      [_label('purchases', isArabic), value('purchases')],
      [_label('expenses', isArabic), value('expenses')],
      [_label('returns', isArabic), value('returnedLoss')],
      [_label('damaged', isArabic), value('damagedPaid')],
      [_label('cashProfit', isArabic), value('profitCash')],
      [_label('collectedCredit', isArabic), value('profitCollectedCredit')],
      [_label('pendingCredit', isArabic), value('profitPendingCredit')],
      [_label('netProfit', isArabic), value('netProfit')],
    ];

    document.addPage(
      pw.Page(
        textDirection: isArabic ? pw.TextDirection.rtl : pw.TextDirection.ltr,
        theme: pw.ThemeData.withFont(
          base: pw.Font.helvetica(),
          bold: pw.Font.helveticaBold(),
          fontFallback: [arabicFont],
        ),
        build: (context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              _label('reportTitle', isArabic),
              style: pw.TextStyle(
                fontSize: 22,
                fontWeight: pw.FontWeight.bold,
                fontFallback: [arabicFont],
              ),
            ),
            pw.SizedBox(height: 8),
            pw.Text(
              '${_label('period', isArabic)}: ${report['from'] ?? ''} - ${report['to'] ?? ''}',
              style: pw.TextStyle(fontFallback: [arabicFont]),
            ),
            pw.Text(
              '${_label('store', isArabic)}: ${report['storeId'] ?? ''}',
              style: pw.TextStyle(fontFallback: [arabicFont]),
            ),
            pw.SizedBox(height: 20),
            pw.TableHelper.fromTextArray(
              headers: [_label('metric', isArabic), _label('amount', isArabic)],
              data: rows,
              headerStyle: pw.TextStyle(
                fontWeight: pw.FontWeight.bold,
                fontFallback: [arabicFont],
              ),
              cellStyle: pw.TextStyle(fontFallback: [arabicFont]),
              headerDecoration: const pw.BoxDecoration(
                color: PdfColor.fromInt(0xffe8f1fb),
              ),
              cellPadding: const pw.EdgeInsets.all(8),
              cellAlignment: isArabic
                  ? pw.Alignment.centerRight
                  : pw.Alignment.centerLeft,
              headerAlignment: pw.Alignment.center,
              tableDirection: isArabic
                  ? pw.TextDirection.rtl
                  : pw.TextDirection.ltr,
              headerDirection: isArabic
                  ? pw.TextDirection.rtl
                  : pw.TextDirection.ltr,
              border: pw.TableBorder.all(
                color: const PdfColor.fromInt(0xffd7e0e8),
              ),
            ),
          ],
        ),
      ),
    );

    return document.save();
  }

  String _label(String key, bool isArabic) {
    if (!isArabic) {
      return switch (key) {
        'sales' => 'Sales',
        'purchases' => 'Purchases',
        'expenses' => 'Expenses',
        'returns' => 'Returned loss',
        'damaged' => 'Damaged paid',
        'cashProfit' => 'Cash profit',
        'collectedCredit' => 'Collected credit profit',
        'pendingCredit' => 'Pending credit profit',
        'netProfit' => 'Net profit',
        'reportTitle' => 'Sales Report',
        'period' => 'Period',
        'store' => 'Store',
        'metric' => 'Metric',
        'amount' => 'Amount',
        _ => key,
      };
    }

    return switch (key) {
      'sales' =>
        '\u{0627}\u{0644}\u{0645}\u{0628}\u{064A}\u{0639}\u{0627}\u{062A}',
      'purchases' =>
        '\u{0627}\u{0644}\u{0645}\u{0634}\u{062A}\u{0631}\u{064A}\u{0627}\u{062A}',
      'expenses' =>
        '\u{0627}\u{0644}\u{0645}\u{0635}\u{0631}\u{0648}\u{0641}\u{0627}\u{062A}',
      'returns' =>
        '\u{062E}\u{0633}\u{0627}\u{0626}\u{0631} \u{0627}\u{0644}\u{0645}\u{0631}\u{062A}\u{062C}\u{0639}\u{0627}\u{062A}',
      'damaged' =>
        '\u{062A}\u{0643}\u{0644}\u{0641}\u{0629} \u{0627}\u{0644}\u{062A}\u{0627}\u{0644}\u{0641}',
      'cashProfit' =>
        '\u{0627}\u{0644}\u{0631}\u{0628}\u{062D} \u{0627}\u{0644}\u{0646}\u{0642}\u{062F}\u{064A}',
      'collectedCredit' =>
        '\u{0631}\u{0628}\u{062D} \u{0627}\u{0644}\u{0627}\u{0626}\u{062A}\u{0645}\u{0627}\u{0646} \u{0627}\u{0644}\u{0645}\u{062D}\u{0635}\u{0644}',
      'pendingCredit' =>
        '\u{0631}\u{0628}\u{062D} \u{0627}\u{0644}\u{0627}\u{0626}\u{062A}\u{0645}\u{0627}\u{0646} \u{0627}\u{0644}\u{0645}\u{0639}\u{0644}\u{0642}',
      'netProfit' =>
        '\u{0635}\u{0627}\u{0641}\u{064A} \u{0627}\u{0644}\u{0631}\u{0628}\u{062D}',
      'reportTitle' =>
        '\u{062A}\u{0642}\u{0631}\u{064A}\u{0631} \u{0627}\u{0644}\u{0645}\u{0628}\u{064A}\u{0639}\u{0627}\u{062A}',
      'period' => '\u{0627}\u{0644}\u{0641}\u{062A}\u{0631}\u{0629}',
      'store' => '\u{0627}\u{0644}\u{0645}\u{062A}\u{062C}\u{0631}',
      'metric' => '\u{0627}\u{0644}\u{0628}\u{064A}\u{0627}\u{0646}',
      'amount' => '\u{0627}\u{0644}\u{0642}\u{064A}\u{0645}\u{0629}',
      _ => key,
    };
  }

  Map<String, dynamic> _asMap(dynamic value) {
    if (value is Map<String, dynamic>) return value;
    if (value is Map) return value.cast<String, dynamic>();
    return const {};
  }
}
