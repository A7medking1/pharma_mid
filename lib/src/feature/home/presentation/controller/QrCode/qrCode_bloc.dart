import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:king_saud_hospital/src/core/enums.dart';
import 'package:king_saud_hospital/src/feature/home/data/model/qr_code_model.dart';
import 'package:king_saud_hospital/src/feature/home/domain/use_cases/get_QrCode.dart';

part 'qrCode_event.dart';

part 'qrCode_state.dart';

class QrCodeBloc extends Bloc<QrCodeEvent, QrCodeState> {
  QrCodeBloc(this.getQrCodeUseCase) : super(const QrCodeState()) {
    on<GetQrCodeEvent>(_getQrCode);
  }

  final GetQrCodeUseCase getQrCodeUseCase;

  FutureOr<void> _getQrCode(
      GetQrCodeEvent event, Emitter<QrCodeState> emit) async {
    emit(state.copyWith(reqState: ReqState.loading));

    final res = await getQrCodeUseCase('');

    res.fold(
      (l) => emit(
        state.copyWith(
          reqState: ReqState.error,
          message: l.message,
        ),
      ),
      (r) {
        r.isEmpty
            ? emit(
                state.copyWith(
                  reqState: ReqState.empty,
                ),
              )
            : emit(
                state.copyWith(
                  reqState: ReqState.success,
                  qrCodes: r,
                ),
              );
      },
    );
  }
}
