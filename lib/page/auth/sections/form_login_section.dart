part of '../login_page.dart';

class _FormLoginSection extends StatefulWidget {
  @override
  State<_FormLoginSection> createState() => _FormLoginSectionState();
}

class _FormLoginSectionState extends State<_FormLoginSection> {
  late TextEditingController _cEmail;
  late TextEditingController _cUsername;
  late TextEditingController _cPassword;
  late bool _obscure;
  late GlobalKey<FormState> _formKey;
  late bool _isLoading;
  late AuthBloc _authBloc;
  late Helper _helper;
  late SingletonModel _model;

  @override
  void initState() {
    _cEmail = TextEditingController();
    _cEmail.addListener(() {
      setState(() {
        _cEmail.text.isNotEmpty;
      });
    });
    _cUsername = TextEditingController();
    _cUsername.addListener(() {
      setState(() {
        _cUsername.text.isNotEmpty;
      });
    });
    _cPassword = TextEditingController();
    _cPassword.addListener(() {
      setState(() {
        _cPassword.text.isNotEmpty;
      });
    });
    _obscure = true;
    _formKey = GlobalKey();
    _isLoading = false;
    _authBloc = BlocProvider.of<AuthBloc>(context);
    _helper = Helper();
    _model = SingletonModel.withContext(context);
    super.initState();
  }

  @override
  void dispose() {
    _cEmail.dispose();
    _cUsername.dispose();
    _cPassword.dispose();
    super.dispose();
  }

  void _login() async {
    if (!_isLoading) {
      if (_formKey.currentState!.validate()) {
        setState(() {
          _isLoading = true;
          _authBloc.add(
            LoginEvent(
                email: _cEmail.text,
                username: _cUsername.text,
                password: _cEmail.text),
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _authBloc,
      listener: (context, state) {
        if (state is LoginSuccessState) {
          _isLoading = false;
          _helper.showToast(_model.login!.message);
          _helper.backToRootPage(context);
          _helper.moveToPage(
            context,
            route: HomePage.name,
          );
        } else if (state is LoginFailedState) {
          _isLoading = false;
          _helper.showToast('Failed! Please try again');
        }
      },
      child: BlocBuilder(
        bloc: _authBloc,
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  formField(
                    controller: _cEmail,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 17,
                      horizontal: 18,
                    ),
                    inputType: TextInputType.emailAddress,
                    hintText: 'Enter Email',
                    inputFormatter: [RemoveEmojiInputFormatter()],
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your email address';
                      }
                      if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  formField(
                    controller: _cUsername,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 17,
                      horizontal: 18,
                    ),
                    inputType: TextInputType.text,
                    hintText: 'Enter Username',
                    inputFormatter: [RemoveEmojiInputFormatter()],
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'This field is required';
                      }
                      if (value.trim().length < 4) {
                        return 'Username must be at least 4 characters in length';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  formField(
                    controller: _cPassword,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 17,
                      horizontal: 18,
                    ),
                    inputType: TextInputType.text,
                    hintText: 'Enter Password',
                    inputFormatter: [RemoveEmojiInputFormatter()],
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'This field is required';
                      }
                      if (value.trim().length < 8) {
                        return 'Password must be at least 8 characters in length';
                      }
                      return null;
                    },
                    obscure: _obscure,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscure = !_obscure;
                        });
                      },
                      icon: Icon(
                        _obscure ? Icons.visibility_off : Icons.visibility,
                        color: hGolden.last,
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  ButtonAuth(
                    onPressed:
                        _cEmail.text.isNotEmpty && _cPassword.text.isNotEmpty
                            ? _login
                            : null,
                    text: 'Login',
                    loading: _isLoading,
                    textColor:
                        _cEmail.text.isNotEmpty && _cPassword.text.isNotEmpty
                            ? Colors.white
                            : Colors.white.withOpacity(.3),
                    height: 48,
                    radius: 8,
                    gradient: LinearGradient(
                      colors: [
                        _cEmail.text.isNotEmpty && _cPassword.text.isNotEmpty
                            ? hSecond1
                            : hSecond1.withOpacity(.3),
                        _cEmail.text.isNotEmpty && _cPassword.text.isNotEmpty
                            ? hSecond2
                            : hSecond2.withOpacity(.3),
                      ],
                    ),
                    shadow:
                        _cEmail.text.isNotEmpty && _cPassword.text.isNotEmpty
                            ? [
                                BoxShadow(
                                  offset: const Offset(0, 10),
                                  color: hSecond1.withOpacity(.5),
                                  blurRadius: 18.0,
                                ),
                                BoxShadow(
                                  offset: const Offset(0, 10),
                                  color: hSecond2.withOpacity(.5),
                                  blurRadius: 18.0,
                                ),
                              ]
                            : [],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
