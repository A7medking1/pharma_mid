part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginAuthEvent extends AuthEvent {
  final LoginEntity loginEntity;
  final BuildContext context ;

  const LoginAuthEvent(this.loginEntity,{required this.context});
}

