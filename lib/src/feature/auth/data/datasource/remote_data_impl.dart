import 'package:dio/dio.dart';
import 'package:king_saud_hospital/src/core/api/api_constant.dart';
import 'package:king_saud_hospital/src/core/api/api_consumer.dart';
import 'package:king_saud_hospital/src/core/app_prefs/app_prefs.dart';
import 'package:king_saud_hospital/src/core/services/index.dart';
import 'package:king_saud_hospital/src/feature/auth/data/datasource/remote_data_source.dart';
import 'package:king_saud_hospital/src/feature/auth/domain/entity/login_entity.dart';
import 'package:king_saud_hospital/src/feature/home/data/model/user_Model.dart';

class AuthRemoteDataSourceImpl extends AuthBaseRemoteDataSource {
  final ApiConsumer apiConsumer;

  AuthRemoteDataSourceImpl(this.apiConsumer);

  @override
  Future<String> login(LoginEntity parameters) async {
    final Response response = await apiConsumer.post(
      ApiConstant.login,
      body: {
        'email': parameters.email,
      },
    );
    sl<AppPreferences>().setUser(
      UserModel(
        message: response.data['message'],
        token: response.data['token'],
        email: response.data['email'],
        userId: response.data['user_id'],
        status: response.data['status'],
      ),
    );
    sl<AppPreferences>().saveUserEmail(response.data['email']);
    return response.data['token'];
  }
}
