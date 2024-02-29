import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  final String email;


  const LoginEntity({
    required this.email,
  });

  @override
  List<Object> get props => [email];
}
