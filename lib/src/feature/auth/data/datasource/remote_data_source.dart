import 'package:king_saud_hospital/src/feature/auth/domain/entity/login_entity.dart';

abstract class AuthBaseRemoteDataSource {
  Future<String> login(LoginEntity parameters);
}
