// ignore_for_file: library_private_types_in_public_api

const String _baseUrl = "https://techtest.youapp.ai/api/";

class API {
  _Auth auth = _Auth();
  _User user = _User();

  static const baseUrl = _baseUrl;
}

class _Auth {
  final String login = "login";
  final String register = "register";
}

class _User {
  final String create = "createProfile";
  final String get = "getProfile";
  final String update = "updateProfile";
}
