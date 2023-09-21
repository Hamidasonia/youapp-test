import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remove_emoji_input_formatter/remove_emoji_input_formatter.dart';
import 'package:youapp_test/bloc/auth/auth_bloc.dart';
import 'package:youapp_test/bloc/auth/auth_event.dart';
import 'package:youapp_test/bloc/auth/auth_state.dart';
import 'package:youapp_test/common/constans.dart';
import 'package:youapp_test/common/styles.dart';
import 'package:youapp_test/model/app/singleton_model.dart';
import 'package:youapp_test/page/auth/components/components.dart';
import 'package:youapp_test/page/auth/register_page.dart';
import 'package:youapp_test/page/home/home_page.dart';
import 'package:youapp_test/tool/helper.dart';

part 'sections/form_login_section.dart';

class LoginPage extends StatelessWidget {
  static const String name = "/login";

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [hPrimary1, hPrimary2, hPrimary3],
              radius: 2,
              center: Alignment.topRight,
              focal: Alignment.topRight,
              focalRadius: 0.25,
            ),
          ),
          child: ListView(
            children: [
              const SizedBox(height: 37),
              const BackAuth(),
              const SizedBox(height: 60),
              const TextHeaderAuth(text: 'Login'),
              const SizedBox(height: 25),
              _FormLoginSection(),
              const SizedBox(height: 52),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'No account? ',
                    style:
                        AppTextStyle.medium(fontSize: 13, color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: () => Helper().jumpToPage(
                      context,
                      route: RegisterPage.name,
                    ),
                    child: Image.asset(
                      kImgRegister,
                      height: 11,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
