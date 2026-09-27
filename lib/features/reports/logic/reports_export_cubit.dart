import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/helpers/shared_pref_helper.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/reports/domain/use_cases/export_sales_report_use_case.dart';
import 'package:skeleton_mobile_app/features/reports/logic/reports_export_state.dart';

@injectable
class ReportsExportCubit extends Cubit<ReportsExportState> {
  final ExportSalesReportUseCase _useCase;

  ReportsExportCubit(this._useCase) : super(const ReportsExportInitial());

  Future<void> exportMonth(
    DateTime selectedMonth, {
    required bool isArabic,
  }) async {
    emit(const ReportsExportLoading());

    final storeId = await SharedPrefHelper.getInt(SharedPrefHelper.storeIdKey);
    final from = DateTime(selectedMonth.year, selectedMonth.month);
    final to = DateTime(
      selectedMonth.year,
      selectedMonth.month + 1,
    ).subtract(const Duration(microseconds: 1));

    final result = await _useCase.invoke(
      from: from,
      to: to,
      storeId: storeId,
      isArabic: isArabic,
    );

    if (isClosed) return;
    result.when(
      success: (bytes) => emit(ReportsExportSuccess(bytes)),
      failure: (error) => emit(ReportsExportError(error)),
    );
  }
}
