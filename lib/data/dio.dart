import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as d;
import 'package:youapp_test/data/api.dart';
import 'package:youapp_test/data/sp_data.dart';
import 'package:youapp_test/model/app/singleton_model.dart';
import 'package:youapp_test/page/onboard_page.dart';
import 'package:youapp_test/tool/helper.dart';
import 'dart:async';
import 'dart:io';

class Dio {
  late d.Dio _dio;
  late Helper _helper;

  Dio({Map<String, dynamic>? headers}) {
    _dio = d.Dio();
    _helper = Helper();
    _dio.options = d.BaseOptions(
      baseUrl: API.baseUrl,
      connectTimeout: const Duration(milliseconds: 20000),
      receiveTimeout: const Duration(milliseconds: 20000),
      responseType: ResponseType.json,
      headers: headers ??
          {
            "Accept": "application/json",
            "Content-Type": "application/json",
            if (SingletonModel.shared.isLoggedIn)
              "Authorization": SingletonModel.shared.login!.accessToken,
          },
    );
    _dio.interceptors.add(
      d.InterceptorsWrapper(
          onRequest: (d.RequestOptions o, d.RequestInterceptorHandler h) =>
              h.next(o),
          onResponse: (d.Response r, d.ResponseInterceptorHandler h) =>
              h.next(r),
          onError: (d.DioException e, d.ErrorInterceptorHandler h) async {
            if (e.response?.statusCode != null) {
              int code = e.response!.statusCode!;
              if (code == 400 || code == 422 || code == 405) {
                _helper
                    .showToast(e.response?.data?['message'] ?? "Unknown Error");
              }
              if (code == 401) {
                SPData.reset();
                _helper.backToRootPage(SingletonModel.shared.context!);
                _helper.moveToPage(
                  SingletonModel.shared.context!,
                  route: OnBoardPage.name,
                );
                SingletonModel.shared.isLoggedIn = false;
                SingletonModel.shared.login = null;
              }
            }
            return h.next(e);
          }),
    );
  }

  Future post({
    required String url,
    dynamic body,
    Map<String, dynamic>? param,
  }) async {
    try {
      return await _dio.post(
        url,
        queryParameters: param,
        data: body,
      );
    } on TimeoutException catch (e) {
      return Future.error(e);
    } on SocketException catch (e) {
      return Future.error(e);
    } on d.DioException catch (e) {
      return Future.error(e);
    }
  }

  Future put({
    required String url,
    dynamic body,
    Map<String, dynamic>? param,
  }) async {
    try {
      return await _dio.put(
        url,
        queryParameters: param,
        data: body,
      );
    } on TimeoutException catch (e) {
      return Future.error(e);
    } on SocketException catch (e) {
      return Future.error(e);
    } on d.DioException catch (e) {
      return Future.error(e);
    }
  }

  Future get({
    required String url,
    Map<String, dynamic>? param,
  }) async {
    try {
      return await _dio.get(
        url,
        queryParameters: param,
      );
    } on TimeoutException catch (e) {
      return Future.error(e);
    } on SocketException catch (e) {
      return Future.error(e);
    } on d.DioException catch (e) {
      return Future.error(e);
    }
  }

  Future delete({
    required String url,
    Map<String, dynamic>? param,
  }) async {
    try {
      return await _dio.delete(
        url,
        queryParameters: param,
      );
    } on TimeoutException catch (e) {
      return Future.error(e);
    } on SocketException catch (e) {
      return Future.error(e);
    } on d.DioException catch (e) {
      return Future.error(e);
    }
  }

  Future download({
    required String url,
    required String path,
    dynamic body,
    Map<String, dynamic>? param,
    Function(int count, int total)? onReceiveProgress,
  }) async {
    try {
      return await _dio.download(
        url,
        path,
        data: body,
        onReceiveProgress: onReceiveProgress,
        queryParameters: param,
      );
    } on TimeoutException catch (e) {
      return Future.error(e);
    } on SocketException catch (e) {
      return Future.error(e);
    } on d.DioException catch (e) {
      return Future.error(e);
    }
  }
}
