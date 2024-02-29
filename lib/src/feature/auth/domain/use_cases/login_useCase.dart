import 'package:king_saud_hospital/src/core/error/failures.dart';
import 'package:king_saud_hospital/src/core/use_case/base_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:king_saud_hospital/src/feature/auth/domain/entity/login_entity.dart';
import 'package:king_saud_hospital/src/feature/auth/domain/repository/base_auth_repository.dart';

class LoginUseCase extends BaseUseCase<String, LoginEntity> {
  final BaseAuthRepository authRepository;

  LoginUseCase(this.authRepository);

  @override
  Future<Either<Failure, String>> call(LoginEntity parameters) async {
    return await authRepository.login(parameters);
  }
}
