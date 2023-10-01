import 'package:flutter/material.dart';
import 'package:youapp_test/common/constans.dart';
import 'package:youapp_test/common/styles.dart';
import 'package:youapp_test/page/auth/components/components.dart';
import 'package:youapp_test/page/auth/login_page.dart';
import 'package:youapp_test/tool/helper.dart';

class OnBoardPage extends StatefulWidget {
  static const String name = "/onboard";
  const OnBoardPage({super.key});

  @override
  State<OnBoardPage> createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {
  final _image = const AssetImage(kImgBg);

  @override
  void didChangeDependencies() {
    precacheImage(_image, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: _image,
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                hPrimary2.withOpacity(0.2),
                hPrimary3.withOpacity(0.8),
              ],
              stops: const [0.4, 0.8],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 30,
                right: 5,
                child: Image.asset(
                  kImgApp,
                  width: 100,
                  height: 100,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    const Spacer(),
                    Text(
                      'Y O U A P P',
                      style: AppTextStyle.semiBold(fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 36),
                      child: Text(
                        'Join forces with our network of like-minded individuals, leverage our robust infrastructure, and create an experiences that will leave a lasting impact.',
                        style: AppTextStyle.medium(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: ButtonAuth(
                        onPressed: () => Helper().jumpToPage(
                          context,
                          route: LoginPage.name,
                        ),
                        text: 'L O G I N',
                        loading: false,
                        textColor: Colors.black,
                        height: 48,
                        radius: 8,
                        gradient: LinearGradient(
                          colors: hGolden,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
