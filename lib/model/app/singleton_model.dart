import 'package:flutter/material.dart';
import 'package:youapp_test/model/login_model.dart';

class SingletonModel {
  static SingletonModel? _singleton;

  factory SingletonModel() => _singleton ?? SingletonModel._internal();

  SingletonModel._internal();

  static SingletonModel withContext(BuildContext context) {
    _singleton ??= SingletonModel._internal();
    _singleton!.context = context;

    return _singleton!;
  }

  static SingletonModel get shared => _singleton ?? SingletonModel._internal();

  late bool isLoggedIn;
  LoginModel? login;
  BuildContext? context;
}
