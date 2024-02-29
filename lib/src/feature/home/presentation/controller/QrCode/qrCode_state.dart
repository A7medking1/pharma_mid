part of 'qrCode_bloc.dart';

class QrCodeState extends Equatable {
  final String message;
  final ReqState reqState;

  final List<QrCodeModel> qrCodes;

  const QrCodeState({
    this.message = '',
    this.reqState = ReqState.loading,
    this.qrCodes = const [],
  });

  QrCodeState copyWith({
    String? message,
    ReqState? reqState,
    List<QrCodeModel>? qrCodes,
  }) {
    return QrCodeState(
      qrCodes: qrCodes ?? this.qrCodes,
      message: message ?? this.message,
      reqState: reqState ?? this.reqState,
    );
  }

  @override
  List<Object?> get props => [message, reqState, qrCodes];
}
