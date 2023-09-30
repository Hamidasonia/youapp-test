import 'package:flutter/material.dart';
import 'package:youapp_test/page/auth/login_page.dart';
import 'package:youapp_test/page/auth/register_page.dart';
import 'package:youapp_test/page/home/home_page.dart';
import 'package:youapp_test/page/interest/interest_page.dart';
import 'package:youapp_test/page/onboard_page.dart';
import 'package:youapp_test/page/splash_page.dart';

Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  SplashPage.name: (BuildContext context) => const SplashPage(),
  OnBoardPage.name: (BuildContext context) => const OnBoardPage(),
  LoginPage.name: (BuildContext context) => const LoginPage(),
  RegisterPage.name: (BuildContext context) => const RegisterPage(),
  HomePage.name: (BuildContext context) => const HomePage(),
  InterestPage.name: (BuildContext context) => const InterestPage(),
};
