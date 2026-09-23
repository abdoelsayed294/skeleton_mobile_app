import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/reports/domain/use_cases/reports_sales_use_case.dart';
import 'package:skeleton_mobile_app/features/reports/logic/reports_sales_state.dart';

@injectable
class ReportsSalesCubit extends Cubit<ReportsSalesState> {
  final ReportsSalesUseCase reportsSalesUseCase;

  ReportsSalesCubit(this.reportsSalesUseCase)
    : super(const ReportsSalesState.initial());

  Future<void> getReportsSales({
    required int storeId,
    required String period,
  }) async {
    emit(const ReportsSalesState.loading());
    final result = await reportsSalesUseCase.getReportsSales(period, storeId);
    result.when(
      success: (data) => emit(ReportsSalesState.success(data)),
      failure: (error) => emit(ReportsSalesState.error(error)),
    );
  }
}
