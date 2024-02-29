import 'package:dartz/dartz.dart';
import 'package:king_saud_hospital/src/core/error/exceptions.dart';
import 'package:king_saud_hospital/src/core/error/failures.dart';
import 'package:king_saud_hospital/src/feature/auth/data/datasource/remote_data_source.dart';
import 'package:king_saud_hospital/src/feature/auth/domain/entity/login_entity.dart';
import 'package:king_saud_hospital/src/feature/auth/domain/repository/base_auth_repository.dart';

class AuthRepository extends BaseAuthRepository {
  final AuthBaseRemoteDataSource remoteDataSource;

  AuthRepository(this.remoteDataSource);

  @override
  Future<Either<Failure, String>> login(LoginEntity parameters) async {
    try {
      final result = await remoteDataSource.login(parameters);

      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }
}
