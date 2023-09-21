import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remove_emoji_input_formatter/remove_emoji_input_formatter.dart';
import 'package:youapp_test/common/constans.dart';
import 'package:youapp_test/common/styles.dart';
import 'package:youapp_test/page/auth/components/components.dart';

part 'sections/form_register_section.dart';

class RegisterPage extends StatelessWidget {
  static const String name = "/register";

  const RegisterPage({super.key});

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
              const TextHeaderAuth(text: 'Register'),
              const SizedBox(height: 25),
              _FormRegisterSection(),
              const SizedBox(height: 46),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Have an account? ',
                    style:
                        AppTextStyle.medium(fontSize: 13, color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Image.asset(
                      kImgLogin,
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
