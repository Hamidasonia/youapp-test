import 'package:flutter/material.dart';
import 'package:youapp_test/core/core.dart';
import 'package:youapp_test/features/auth/auth.dart';

class OnBoardPage extends StatelessWidget {
  const OnBoardPage({super.key});

  static const String routeName = '/onboard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(MainAssets.backgroundImg),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors().hPrimary2.withOpacity(0.2),
                AppColors().hPrimary3.withOpacity(0.8),
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
                  MainAssets.appImg,
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
                        onPressed: () {
                          // Route ke login
                          Navigator.pushNamed(context, LoginPage.routeName);
                        },
                        text: 'L O G I N',
                        loading: false,
                        textColor: Colors.black,
                        height: 48,
                        radius: 8,
                        gradient: LinearGradient(
                          colors: AppColors().hGolden,
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
