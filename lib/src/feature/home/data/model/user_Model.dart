import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String message;
  final String token;
  final String email;
  final int userId;
  final String status;

  const UserModel({
    required this.message,
    required this.token,
    required this.email,
    required this.userId,
    required this.status,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      message: json["message"],
      token: json["token"],
      email: json["email"],
      userId: json["user_id"],
      status: json["status"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "message": message,
      "token": token,
      "email": email,
      "user_id": userId,
      "status": status,
    };
  }

  @override
  List<Object> get props => [message, token, email, userId, status];
}
