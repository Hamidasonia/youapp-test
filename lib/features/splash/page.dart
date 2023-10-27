import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youapp_test/core/core.dart';
import 'package:youapp_test/features/auth/auth.dart';
import 'package:youapp_test/features/home/home.dart';
import 'package:youapp_test/features/onboard/page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.status == AuthStatus.authorized) {
          // Ke halaman Home
          Navigator.pushNamedAndRemoveUntil(
              context, HomePage.routeName, (route) => false);
        } else if (state.status == AuthStatus.unAuthorized) {
          // ke Halaman OnBoard
          Navigator.pushNamedAndRemoveUntil(
              context, OnBoardPage.routeName, (route) => false);
        }
      },
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [
                HexColor("#152D37"),
                AppColors().hPrimary2,
                AppColors().hPrimary3
              ],
              radius: 1,
              focal: Alignment.center,
              focalRadius: 0.2,
            ),
          ),
          child: Center(
            child: Image.asset(
              MainAssets.appImg,
              height: 110,
            ),
          ),
        ),
      ),
    );
  }
}
