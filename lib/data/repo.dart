// ignore_for_file: library_private_types_in_public_api

import 'package:dio/dio.dart' as dio;
import 'package:youapp_test/data/api.dart';
import 'package:youapp_test/data/dio.dart';

late API _api;
late Dio _dio;

class Repo {
  late _Auth auth;
  late _User user;

  Repo() {
    _api = API();
    _dio = Dio();
    auth = _Auth();
    user = _User();
  }
}

class _Auth {
  Future<dio.Response> login({required Map<String, dynamic> data}) async {
    return await _dio.post(
      url: _api.auth.login,
      body: data,
    );
  }

  Future<dio.Response> register({required Map<String, dynamic> data}) async {
    return await _dio.post(
      url: _api.auth.register,
      body: data,
    );
  }
}

class _User {
  Future<dio.Response> create({required Map<String, dynamic> data}) async {
    return await _dio.post(
      url: _api.user.create,
      body: data,
    );
  }

  Future<dio.Response> get() async {
    return await _dio.get(url: _api.user.get);
  }

  Future<dio.Response> update({required Map<String, dynamic> data}) async {
    return await _dio.put(
      url: _api.user.update,
      body: data,
    );
  }
}
