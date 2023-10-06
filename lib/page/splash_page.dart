// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:youapp_test/common/constans.dart';
import 'package:youapp_test/common/styles.dart';
import 'package:youapp_test/data/sp_data.dart';
import 'package:youapp_test/model/app/singleton_model.dart';
import 'package:youapp_test/model/login_model.dart';
import 'package:youapp_test/model/user_model.dart';
import 'package:youapp_test/page/home/home_page.dart';
import 'package:youapp_test/page/onboard_page.dart';
import 'package:youapp_test/tool/helper.dart';
import 'package:youapp_test/tool/hex_color.dart';

class SplashPage extends StatefulWidget {
  static const String name = "/splash";

  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late Helper _helper;
  late SingletonModel _model;

  @override
  void initState() {
    _helper = Helper();
    _model = SingletonModel.withContext(context);
    _checkData();
    super.initState();
  }

  void _checkData() async {
    String? login = await SPData.load(kDLogin);
    String? user = await SPData.load(kDUser);
    _model.isLoggedIn = (login != null && user != null);
    if (_model.isLoggedIn) {
      _model.login = LoginModel.fromJson(jsonDecode(login!));
      _model.user = UserModel.fromJson(jsonDecode(user!));
    }
    await Future.delayed(const Duration(seconds: 2));
    _helper.moveToPage(
      context,
      route: !_model.isLoggedIn ? OnBoardPage.name : HomePage.name,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [HexColor("#152D37"), hPrimary2, hPrimary3],
            radius: 1,
            focal: Alignment.center,
            focalRadius: 0.2,
          ),
        ),
        child: Center(
          child: Image.asset(
            kImgApp,
            height: 110,
          ),
        ),
      ),
    );
  }
}
