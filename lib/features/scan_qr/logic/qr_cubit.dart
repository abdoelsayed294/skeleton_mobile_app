import 'package:bloc/bloc.dart';
import 'package:skeleton_mobile_app/features/scan_qr/domain/use_cases/qr_use_case.dart';
import 'package:skeleton_mobile_app/features/scan_qr/logic/qr_state.dart';
class QrCubit extends Cubit<QrState> {
  final QrUseCase _qrUseCase;
QrCubit(this._qrUseCase) : super(QrState.initial());
Future<void> getQrStatus(String token) async {
    emit(QrState.loading());
    final result = await _qrUseCase.invoke(token);
    result.when(
      success: (data) { 
        emit(QrState.success(data)); 
      },
      failure: (error) => emit(QrState.error(error)),
    );
  }

  
}
