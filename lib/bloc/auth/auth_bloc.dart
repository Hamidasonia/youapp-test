import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youapp_test/bloc/auth/auth_event.dart';
import 'package:youapp_test/bloc/auth/auth_state.dart';
import 'package:youapp_test/common/constans.dart';
import 'package:youapp_test/data/request.dart';
import 'package:youapp_test/data/sp_data.dart';
import 'package:youapp_test/model/app/response_model.dart';
import 'package:youapp_test/model/app/singleton_model.dart';
import 'package:youapp_test/model/login_model.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(AuthState initialState) : super(initialState);

  @override
  Stream<AuthState> mapEventToState(
      AuthEvent event,
      ) async* {
    if (event is LoginEvent) {
      yield* _login(event);
    } else if (event is RegisterEvent) {
      yield* _register(event);
    }
  }

  Stream<AuthState> _login(LoginEvent event) async* {
    yield AuthInitialState();
    try {
      Response res = await Request().auth.login(
        email: event.email,
        username: event.username,
        password: event.password,
      );
      LoginModel login = LoginModel.fromJson(res.data);
      SingletonModel.shared.login = login;
      SPData.save<String>(
          kDUser, jsonEncode(SingletonModel.shared.login!.toJson()));
      SingletonModel.shared.isLoggedIn = true;
      yield LoginSuccessState();
    } catch (e) {
      yield LoginFailedState(error: e);
      printLog(e);
      printLog('INI ERRORNYA : $e');
    }
  }

  Stream<AuthState> _register(RegisterEvent event) async* {
    yield AuthInitialState();
    try {
      Response res = await Request().auth.register(
        email: event.email,
        username: event.username,
        password: event.password,
      );
      ResponseModel data = ResponseModel.fromJson(res.data);
      yield RegisterSuccessState(data: data);
    } catch (e) {
      yield RegisterFailedState(error: e);
      printLog(e);
    }
  }
}
