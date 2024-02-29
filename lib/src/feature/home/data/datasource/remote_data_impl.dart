import 'package:dio/dio.dart';
import 'package:king_saud_hospital/src/core/api/api_constant.dart';
import 'package:king_saud_hospital/src/core/api/api_consumer.dart';
import 'package:king_saud_hospital/src/core/app_prefs/app_prefs.dart';
import 'package:king_saud_hospital/src/core/services/index.dart';
import 'package:king_saud_hospital/src/feature/home/data/datasource/remote_data_source.dart';
import 'package:king_saud_hospital/src/feature/home/data/model/qr_code_model.dart';
import 'package:king_saud_hospital/src/feature/home/data/model/sessions_model.dart';
import 'package:king_saud_hospital/src/feature/home/data/model/speakers_model.dart';
import 'package:king_saud_hospital/src/feature/home/data/model/user_Model.dart';

class HomeRemoteDataSourceImpl extends HomeBaseRemoteDataSource {
  final ApiConsumer apiConsumer;

  HomeRemoteDataSourceImpl(this.apiConsumer);

  @override
  Future<List<SpeakersModel>> getSpeakers(int page) async {
    final isUserSkipLogin = sl<AppPreferences>().isSkipLogin();

    if (isUserSkipLogin) {
      /// TODO user Skip Login
      final Response response = await apiConsumer.get(
        ApiConstant.home,
      );
      return List<SpeakersModel>.from(
          (response.data[0]['data']).map((e) => SpeakersModel.fromJson(e)));
    }

    /// TODO user  Login

    final Response response =
        await apiConsumer.get(ApiConstant.speakers, queryParameters: {
      'page': page,
    });
    return List<SpeakersModel>.from(
        (response.data).map((e) => SpeakersModel.fromJson(e)));

    ///
  }

  @override
  Future<List<HomeSessionsModel>> getHomeProgrammes() async {
    final UserModel user = sl<AppPreferences>().getUser();

    final isUserSkipLogin = sl<AppPreferences>().isSkipLogin();

    if (isUserSkipLogin) {
      /// TODO user Skip Login

      final Response response = await apiConsumer.get(
        ApiConstant.home,
      );
      return List<HomeSessionsModel>.from(
          (response.data[1]['data']).map((e) => HomeSessionsModel.fromJson(e)));
    }

    /// TODO user  Login

    final Response response =
        await apiConsumer.get(ApiConstant.programs, queryParameters: {
      "user_id": user.userId.toString(),
    });
    return List<HomeSessionsModel>.from(
        (response.data).map((e) => HomeSessionsModel.fromJson(e)));
  }

  @override
  Future<String> addToFavorite(String itemId) async {
    final UserModel user = sl<AppPreferences>().getUser();

    final Response response = await apiConsumer.post(
      ApiConstant.addToFavorite,
      queryParameters: {
        "item_id": itemId,
        "user_id": user.userId.toString(),
      },
    );
    return response.data['message'];
  }

  @override
  Future<String> deleteFromFavorite(String itemId) async {
    final UserModel user = sl<AppPreferences>().getUser();

    final Response response = await apiConsumer.post(
      ApiConstant.deleteFromFavorite,
      queryParameters: {
        "item_id": itemId,
        "user_id": user.userId.toString(),
      },
    );
    return response.data['message'];
  }

  @override
  Future<List<HomePrograms>> getFavorites() async {
    final UserModel user = sl<AppPreferences>().getUser();

    final Response response = await apiConsumer.get(
      ApiConstant.getFavorite,
      queryParameters: {
        'user_id': user.userId.toString(),
      },
    );
    return List<HomePrograms>.from(
      (response.data['favorite_items']).map(
        (e) => HomePrograms.fromJson(e),
      ),
    );
  }

  @override
  Future<String> checkQrCode(String qrCode) async {
    final Response response = await apiConsumer.post(
      ApiConstant.checkQrCode,
      queryParameters: {
        "qr": qrCode,
      },
    );
    return response.data['message'];
  }

  @override
  Future<List<QrCodeModel>> getQrCode(String email) async {
    final UserModel user = sl<AppPreferences>().getUser();

    final Response response = await apiConsumer.get(
      ApiConstant.getQrCode,
      queryParameters: {
        "email": user.email,
      },
    );
    return List<QrCodeModel>.from(
      (response.data).map(
        (e) => QrCodeModel.fromJson(e),
      ),
    );
  }

  @override
  Future<List<HomePrograms>> searchProgrammes(String query) async {
    final Response response = await apiConsumer.get(
      ApiConstant.search,
      queryParameters: {
        'search': query,
      },
    );
    return List<HomePrograms>.from(
      (response.data['search_results']).map(
        (e) => HomePrograms.fromJson(e),
      ),
    );
  }

/*
  @override
  Future<ProgrammesModel> getAgenda() async {
    final UserModel user = sl<AppPreferences>().getUser();

    final Response response =
        await apiConsumer.get(ApiConstant.programs, queryParameters: {
      "user_id": user.userId.toString(),
    });
    return ProgrammesModel.fromJson(response.data[0]);
  }
*/

  @override
  Future<String> pauseAccount() async {
    final UserModel user = sl<AppPreferences>().getUser();

    final Response response = await apiConsumer.post(
      ApiConstant.pauseAccount,
      queryParameters: {
        "new_status": '0',
        "user_id": user.userId.toString(),
      },
    );
    return response.data['message'];
  }
}
