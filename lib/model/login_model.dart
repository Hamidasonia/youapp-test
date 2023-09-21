class LoginModel {
  String message;
  String accessToken;

  LoginModel({
    required this.message,
    required this.accessToken,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    message: json["message"],
    accessToken: json["access_token"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "access_token": accessToken,
  };
}
