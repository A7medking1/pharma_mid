part of 'qrCode_bloc.dart';

abstract class QrCodeEvent extends Equatable {
  const QrCodeEvent();
}

class GetQrCodeEvent extends QrCodeEvent {
  const GetQrCodeEvent();

  @override
  List<Object> get props => [];
}
