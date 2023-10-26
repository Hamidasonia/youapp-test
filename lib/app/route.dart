import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youapp_test/features/auth/auth.dart';
import 'package:youapp_test/features/home/home.dart';
import 'package:youapp_test/features/onboard/page.dart';

final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();
final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

Route<dynamic> route(RouteSettings settings) {
  switch (settings.name) {
    case LoginPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const LoginPage(),
        settings: settings,
      );
    case RegisterPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const RegisterPage(),
        settings: settings,
      );
    case OnBoardPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const OnBoardPage(),
        settings: settings,
      );
    case HomePage.routeName:
      return MaterialPageRoute(
        builder: (_) => const HomePage(),
        settings: settings,
      );
    default:
      return CupertinoPageRoute(builder: (_) {
        return const Scaffold(
          body: Center(
            child: Text('Page not found :('),
          ),
        );
      });
  }
}
