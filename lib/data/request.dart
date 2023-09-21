// ignore_for_file: library_private_types_in_public_api

import 'package:dio/dio.dart' as dio;
import 'package:youapp_test/data/repo.dart';

late Repo _repo;

class Request {
  late _Auth auth;
  late _User user;

  Request() {
    _repo = Repo();
    auth = _Auth();
    user = _User();
  }
}

class _Auth {
  Future<dio.Response> login({
    required String email,
    required String username,
    required String password,
  }) async {
    return _repo.auth.login(data: {
      "email": email,
      "username": username,
      "password": password,
    });
  }

  Future<dio.Response> register({
    required String email,
    required String username,
    required String password,
  }) async {
    return _repo.auth.register(data: {
      "email": email,
      "username": username,
      "password": password,
    });
  }
}

class _User {
  Future<dio.Response> create({
    required String name,
    required String birthday,
    required String height,
    required String weight,
    required List<String> interests,
  }) async {
    return _repo.user.create(data: {
      "name": name,
      "birthday": birthday,
      "height": height,
      "weight": weight,
      "interests" : interests,
    });
  }

  Future<dio.Response> get() async {
    return _repo.user.get();
  }

  Future<dio.Response> update({
    String? name,
    String? birthday,
    String? height,
    String? weight,
    List<String>? interests,
  }) async {
    return _repo.user.update(data: {
      "name": name,
      "birthday": birthday,
      "height": height,
      "weight": weight,
      "interests" : interests,
    });
  }
}