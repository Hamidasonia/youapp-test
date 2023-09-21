import 'package:flutter/material.dart';
import 'package:youapp_test/common/styles.dart';
import 'package:youapp_test/data/sp_data.dart';
import 'package:youapp_test/model/app/singleton_model.dart';
import 'package:youapp_test/page/onboard_page.dart';
import 'package:youapp_test/tool/helper.dart';

class HomePage extends StatefulWidget {
  static const String name = "/home";

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _logout() async {
    SPData.reset();
    SingletonModel.shared.login = null;
    SingletonModel.shared.isLoggedIn = false;
    await Helper().moveToPage(
      context,
      route: OnBoardPage.name,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: hPrimary3,
      floatingActionButton: IconButton(
        icon: Icon(
          Icons.exit_to_app,
          color: hWhite,
        ),
        onPressed: _logout,
      ),
    );
  }
}
