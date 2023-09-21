part of '../register_page.dart';

class _FormRegisterSection extends StatefulWidget {
  @override
  State<_FormRegisterSection> createState() => _FormRegisterSectionState();
}

class _FormRegisterSectionState extends State<_FormRegisterSection> {
  late TextEditingController _cEmail;
  late TextEditingController _cUsername;
  late TextEditingController _cPassword;
  late TextEditingController _cConfirmPassword;
  late bool _obscure;
  late bool _cObscure;
  late GlobalKey<FormState> _formKey;
  String? _password;

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
    _cConfirmPassword = TextEditingController();
    _cConfirmPassword.addListener(() {
      setState(() {
        _cConfirmPassword.text.isNotEmpty;
      });
    });
    _obscure = true;
    _cObscure = true;
    _formKey = GlobalKey();
    super.initState();
  }

  @override
  void dispose() {
    _cEmail.dispose();
    _cUsername.dispose();
    _cPassword.dispose();
    _cConfirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            const SizedBox(height: 11),
            formField(
              controller: _cUsername,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 17,
                horizontal: 18,
              ),
              inputType: TextInputType.text,
              hintText: 'Create Username',
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
            const SizedBox(height: 11),
            formField(
              controller: _cPassword,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 17,
                horizontal: 18,
              ),
              inputType: TextInputType.text,
              inputFormatter: [RemoveEmojiInputFormatter()],
              hintText: 'Create Password',
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
              onChanged: (value) => _password = value,
            ),
            const SizedBox(height: 11),
            formField(
              controller: _cConfirmPassword,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 17,
                horizontal: 18,
              ),
              inputType: TextInputType.text,
              hintText: 'Confirm Password',
              inputFormatter: [RemoveEmojiInputFormatter()],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field is required';
                }

                if (value != _password) {
                  return 'Confimation password does not match the entered password';
                }

                return null;
              },
              obscure: _cObscure,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _cObscure = !_cObscure;
                  });
                },
                icon: Icon(
                  _cObscure ? Icons.visibility_off : Icons.visibility,
                  color: hGolden.last,
                  size: 20,
                ),
              ),
            ),
            const SizedBox(height: 25),
            ButtonAuth(
              onPressed: _cEmail.text.isNotEmpty &&
                      _cUsername.text.isNotEmpty &&
                      _cPassword.text.isNotEmpty &&
                      _cConfirmPassword.text.isNotEmpty
                  ? () {}
                  : null,
              text: 'Register',
              loading: false,
              textColor: _cEmail.text.isNotEmpty &&
                      _cUsername.text.isNotEmpty &&
                      _cPassword.text.isNotEmpty &&
                      _cConfirmPassword.text.isNotEmpty
                  ? Colors.white
                  : Colors.white.withOpacity(.3),
              height: 48,
              radius: 8,
              gradient: LinearGradient(
                colors: [
                  _cEmail.text.isNotEmpty &&
                          _cUsername.text.isNotEmpty &&
                          _cPassword.text.isNotEmpty &&
                          _cConfirmPassword.text.isNotEmpty
                      ? hSecond1
                      : hSecond1.withOpacity(.3),
                  _cEmail.text.isNotEmpty &&
                          _cUsername.text.isNotEmpty &&
                          _cPassword.text.isNotEmpty &&
                          _cConfirmPassword.text.isNotEmpty
                      ? hSecond2
                      : hSecond2.withOpacity(.3),
                ],
              ),
              shadow: _cEmail.text.isNotEmpty &&
                      _cUsername.text.isNotEmpty &&
                      _cPassword.text.isNotEmpty &&
                      _cConfirmPassword.text.isNotEmpty
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
  }
}
