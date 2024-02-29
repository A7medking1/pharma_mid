part of 'auth_bloc.dart';

enum AuthRequestState { loading, error, success }

class AuthState extends Equatable {
  final String message;
  final String? token;

  final AuthRequestState? registerReqState;
  final AuthRequestState? loginReqState;
  final AuthRequestState? verifyEmailReqState;
  final AuthRequestState? forgetPasswordReqState;
  final AuthRequestState? resendCodeReqState;
  final AuthRequestState? resetPasswordReqState;
  final AuthRequestState? verifyCodeReqState;
  final AuthRequestState? logOutReqState;

  const AuthState({
    this.message = '',
    this.registerReqState,
    this.token,
    this.loginReqState,
    this.verifyEmailReqState,
    this.forgetPasswordReqState,
    this.resendCodeReqState,
    this.logOutReqState,
    this.resetPasswordReqState,
    this.verifyCodeReqState,
  });

  AuthState copyWith({
    String? message,
    AuthRequestState? registerReqState,
    AuthRequestState? loginReqState,
    AuthRequestState? verifyEmailReqState,
    AuthRequestState? forgetPasswordReqState,
    String? token,
    AuthRequestState? resendCodeReqState,
    AuthRequestState? logOutReqState,
    AuthRequestState? resetPasswordReqState,
    AuthRequestState? verifyCodeReqState,
  }) {
    return AuthState(
        message: message ?? this.message,
        registerReqState: registerReqState ?? this.registerReqState,
        loginReqState: loginReqState ?? this.loginReqState,
        verifyEmailReqState: verifyEmailReqState ?? this.verifyEmailReqState,
        forgetPasswordReqState:
            forgetPasswordReqState ?? this.forgetPasswordReqState,
        resendCodeReqState: resendCodeReqState ?? this.resendCodeReqState,
        verifyCodeReqState: verifyCodeReqState ?? this.verifyCodeReqState,
        token: token ?? this.token,
        resetPasswordReqState:
            resetPasswordReqState ?? this.resetPasswordReqState,
        logOutReqState: logOutReqState ?? this.logOutReqState);
  }

  @override
  List<Object?> get props => [
        message,
        token,
        registerReqState,
        loginReqState,
        verifyEmailReqState,
        forgetPasswordReqState,
        logOutReqState,
        resendCodeReqState,
        resetPasswordReqState,
        verifyCodeReqState,
      ];
}
