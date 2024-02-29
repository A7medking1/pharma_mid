import 'package:king_saud_hospital/src/feature/home/data/model/home_programmes_model.dart';
import 'package:king_saud_hospital/src/feature/home/data/model/qr_code_model.dart';
import 'package:king_saud_hospital/src/feature/home/data/model/sessions_model.dart';
import 'package:king_saud_hospital/src/feature/home/data/model/speakers_model.dart';

abstract class HomeBaseRemoteDataSource {
  Future<List<SpeakersModel>> getSpeakers(int page);

  Future<List<HomeSessionsModel>> getHomeProgrammes();

 /// Future<ProgrammesModel> getAgenda();

  Future<String> addToFavorite(String itemId);

  Future<List<HomePrograms>> getFavorites();

  Future<String> deleteFromFavorite(String itemId);

  Future<List<HomePrograms>> searchProgrammes(String query);

  Future<List<QrCodeModel>> getQrCode(String email);

  Future<String> checkQrCode(String qrCode);

  Future<String> pauseAccount();
}
