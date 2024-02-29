import 'package:dartz/dartz.dart';
import 'package:king_saud_hospital/src/core/error/exceptions.dart';
import 'package:king_saud_hospital/src/core/error/failures.dart';
import 'package:king_saud_hospital/src/feature/home/data/datasource/remote_data_source.dart';
import 'package:king_saud_hospital/src/feature/home/data/model/home_programmes_model.dart';
import 'package:king_saud_hospital/src/feature/home/data/model/qr_code_model.dart';
import 'package:king_saud_hospital/src/feature/home/data/model/sessions_model.dart';
import 'package:king_saud_hospital/src/feature/home/data/model/speakers_model.dart';
import 'package:king_saud_hospital/src/feature/home/domain/repository/base_home_repository.dart';

class HomeRepository extends BaseHomeRepository {
  final HomeBaseRemoteDataSource remoteDataSource;

  HomeRepository(this.remoteDataSource);

  @override
  Future<Either<Failure, List<SpeakersModel>>> getSpeakers(int page) async {
    try {
      final result = await remoteDataSource.getSpeakers(page);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<HomeSessionsModel>>> getHomeProgrammes() async {
    try {
      final result = await remoteDataSource.getHomeProgrammes();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }

  @override
  Future<Either<Failure, String>> addToFavorite(String itemId) async {
    try {
      final result = await remoteDataSource.addToFavorite(itemId);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }

  @override
  Future<Either<Failure, String>> deleteFromFavorite(String itemId) async {
    try {
      final result = await remoteDataSource.deleteFromFavorite(itemId);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<HomePrograms>>> getFavorites() async {
    try {
      final result = await remoteDataSource.getFavorites();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }

  @override
  Future<Either<Failure, String>> checkQrCode(String qrCode) async {
    try {
      final result = await remoteDataSource.checkQrCode(qrCode);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<QrCodeModel>>> getQrCode(String email) async {
    try {
      final result = await remoteDataSource.getQrCode(email);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<HomePrograms>>> searchProgrammes(String query) async {
    try {
      final result = await remoteDataSource.searchProgrammes(query);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }

 /* @override
  Future<Either<Failure, ProgrammesModel>> getAgenda() async {
    try {
      final result = await remoteDataSource.getAgenda();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }
*/
  @override
  Future<Either<Failure, String>> pauseAccount() async {
    try {
      final result = await remoteDataSource.pauseAccount();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }
}
