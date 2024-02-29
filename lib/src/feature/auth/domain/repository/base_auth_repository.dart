import 'package:king_saud_hospital/src/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:king_saud_hospital/src/feature/auth/domain/entity/login_entity.dart';

abstract class BaseAuthRepository {

  Future<Either<Failure, String>> login(LoginEntity parameters);
}
