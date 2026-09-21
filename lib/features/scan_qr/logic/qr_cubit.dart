import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/scan_qr/domain/use_cases/qr_use_case.dart';
import 'package:skeleton_mobile_app/features/scan_qr/domain/use_cases/save_qr_data_use_case.dart';
import 'package:skeleton_mobile_app/features/scan_qr/logic/qr_state.dart';
@injectable
class QrCubit extends Cubit<QrState> {
  final QrUseCase _qrUseCase;
    final SaveQrDataUseCase _saveQrDataUseCase;

QrCubit(this._qrUseCase, this._saveQrDataUseCase) : super(QrState.initial());
Future<void> getQrStatus(String token) async {
    emit(QrState.loading());
    final result = await _qrUseCase.invoke(token);
    result.when(
      success: (data) async { 
          if (data.status?.toLowerCase() == 'approved' &&
            data.storeId != null &&
            data.businessId != null) {
          await _saveQrDataUseCase.invoke(data);
        }
        emit(QrState.success(data)); 
      },
      failure: (error) => emit(QrState.error(error)),
    );
  }

  
}
