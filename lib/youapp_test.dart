import 'package:flutter/material.dart';
import 'package:youapp_test/page/splash_page.dart';

class YouAppTest extends StatefulWidget {
  const YouAppTest({super.key});

  @override
  State<YouAppTest> createState() => _YouAppTestState();
}

class _YouAppTestState extends State<YouAppTest> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
