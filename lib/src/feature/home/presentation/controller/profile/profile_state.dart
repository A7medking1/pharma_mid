part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  final String message;
  final String image;
  final String email;
  final ReqState reqState;

  const ProfileState({
    this.message = '',
    this.reqState = ReqState.empty,
    this.image = '',
    this.email = '',
  });

  ProfileState copyWith({
    String? message,
    ReqState? reqState,
    List<QrCodeModel>? qrCodes,
    String? image,
    String? email,
  }) {
    return ProfileState(
      message: message ?? this.message,
      reqState: reqState ?? this.reqState,
      image: image ?? this.image,
      email: email ?? this.email,
    );
  }

  @override
  List<Object?> get props => [message, reqState, image,email];
}
