import 'package:flutter/material.dart';
import 'package:youapp_test/common/styles.dart';

class HomePage extends StatefulWidget {
  static const String name = "/home";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: hPrimary3,
    );
  }
}
