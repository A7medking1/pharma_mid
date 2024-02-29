import 'package:dartz/dartz.dart';
import 'package:king_saud_hospital/src/core/error/failures.dart';
import 'package:king_saud_hospital/src/feature/home/data/model/home_programmes_model.dart';
import 'package:king_saud_hospital/src/feature/home/data/model/qr_code_model.dart';
import 'package:king_saud_hospital/src/feature/home/data/model/sessions_model.dart';
import 'package:king_saud_hospital/src/feature/home/data/model/speakers_model.dart';

abstract class BaseHomeRepository {
  Future<Either<Failure, List<SpeakersModel>>> getSpeakers(int page);

  Future<Either<Failure, List<HomeSessionsModel>>> getHomeProgrammes();


 // Future<Either<Failure, ProgrammesModel>> getAgenda();

 // Future<Either<Failure, List<SessionsModel>>> getSessions();

  Future<Either<Failure, String>> addToFavorite(String itemId);

  Future<Either<Failure, List<HomePrograms>>> getFavorites();

  Future<Either<Failure, String>> deleteFromFavorite(String itemId);

  Future<Either<Failure, List<HomePrograms>>> searchProgrammes(String query);

  Future<Either<Failure, List<QrCodeModel>>> getQrCode(String email);

  Future<Either<Failure, String>> checkQrCode(String qrCode);



  Future<Either<Failure, String>> pauseAccount();



}
