// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:youapp_test/common/constans.dart';
import 'package:youapp_test/common/styles.dart';
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
  
  @override
  void initState() {
    _helper = Helper();
    _checkData();
    super.initState();
  }
  
  void _checkData() async {
    await Future.delayed(const Duration(seconds: 2));
    _helper.moveToPage(context, route: OnBoardPage.name);
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
