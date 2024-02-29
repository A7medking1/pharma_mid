import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:king_saud_hospital/src/core/api/api_constant.dart';
import 'package:king_saud_hospital/src/core/api/app_interceptors.dart';
import 'package:king_saud_hospital/src/core/api/status_code.dart';
import 'package:king_saud_hospital/src/core/app_prefs/app_prefs.dart';
import 'package:king_saud_hospital/src/core/network/error_message_model.dart';
import 'package:king_saud_hospital/src/core/services/index.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../error/exceptions.dart';
import 'api_consumer.dart';

class DioConsumer implements ApiConsumer {
  final Dio client;

  DioConsumer({required this.client}) {
    client.options
      ..followRedirects = false
      ..baseUrl = ApiConstant.baseUrl
      ..receiveDataWhenStatusError = true;
    client.interceptors.add(sl<AppInterceptors>());
    if (kDebugMode) {
      client.interceptors.add(sl<PrettyDioLogger>());
    }
  }

  @override
  Future get(String path, {Map<String, dynamic>? queryParameters}) async {
    final lang = sl<AppPreferences>().getAppLang();
    final token = sl<AppPreferences>().getUserToken();

    print(token) ;
    try {
      final response = await client.get(
        path,
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }),
        queryParameters: queryParameters ?? {'lang': lang},
      );
      if (response.statusCode == 200) {
        return response;
      }
    } on DioException catch (error) {
      _handleDioError(error);
    }
  }

  @override
  Future post(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    final token = sl<AppPreferences>().getUserToken();
    try {
      final response = await client.post(
        path,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        }),
        queryParameters: queryParameters,
        data: body,
      );
      if (response.statusCode == 200 || response.data['message'] == 'Success') {
        return response;
      }
    } on DioException catch (error) {
      _handleDioError(error);
    }
  }

  @override
  Future delete(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    final token = sl<AppPreferences>().getUserToken();
    try {
      final response = await client.delete(
        path,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        }),
        queryParameters: queryParameters,
        data: body,
      );
      if (response.statusCode == 200 || response.data['message'] == 'Success') {
        return response;
      }
    } on DioException catch (error) {
      _handleDioError(error);
    }
  }

  @override
  Future put(String path,
      {Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await client.put(path, queryParameters: queryParameters, data: body);
      return response;
    } on DioException catch (error) {
      return _handleDioError(error);
    }
  }

  dynamic _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw const FetchDataException();
      case DioExceptionType.badResponse:
        switch (error.response?.statusCode) {
          case StatusCode.unprocessableEntity:
          case StatusCode.badRequest:
          case StatusCode.tooManyRequests:
            throw BadRequestException(
                ErrorMessageModel.fromJson(error.response!.data));
          case StatusCode.unauthorized:
          case StatusCode.forbidden:
            throw UnauthorizedException(
                ErrorMessageModel.fromJson(error.response!.data));
          case StatusCode.notFound:
            throw NotFoundException(
                ErrorMessageModel.fromJson(error.response!.data));
          case StatusCode.conflict:
            throw ConflictException(
                ErrorMessageModel.fromJson(error.response!.data));
          case StatusCode.internalServerError:
            throw InternalServerErrorException(
                ErrorMessageModel.fromJson(error.response!.data));
        }
      case DioExceptionType.cancel:
      case DioExceptionType.badCertificate:
      case DioExceptionType.connectionError:
      case DioExceptionType.unknown:
        throw NoInternetConnectionException(
          ErrorMessageModel.fromJson(
            const {
              'message': 'No internet connection found',
            },
          ),
        );
    }
  }
}

extension DioErrorX on DioException {
  bool get isNoConnectionError =>
      type == DioExceptionType.unknown &&
      error is SocketException; // import 'dart:io' for SocketException
}
