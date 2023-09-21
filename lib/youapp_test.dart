import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youapp_test/bloc/auth/auth_bloc.dart';
import 'package:youapp_test/bloc/auth/auth_state.dart';
import 'package:youapp_test/common/configs.dart';
import 'package:youapp_test/page/splash_page.dart';

class YouAppTest extends StatefulWidget {
  const YouAppTest({super.key});

  @override
  State<YouAppTest> createState() => _YouAppTestState();
}

class _YouAppTestState extends State<YouAppTest> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (BuildContext context) => AuthBloc(AuthInitialState()),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashPage(),
        routes: routes,
      ),
    );
  }
}
