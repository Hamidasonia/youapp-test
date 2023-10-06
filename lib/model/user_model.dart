class UserModel {
  String message;
  Data data;

  UserModel({
    required this.message,
    required this.data,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  String email;
  String username;
  String? name;
  String? birthday;
  String? horoscope;
  String? zodiac;
  int? height;
  int? weight;
  List<String>? interests;

  Data({
    required this.email,
    required this.username,
    this.name,
    this.birthday,
    this.horoscope,
    this.zodiac,
    this.height,
    this.weight,
    this.interests,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        email: json["email"],
        username: json["username"],
        name: json["name"],
        birthday: json["birthday"],
        horoscope: json["horoscope"],
        zodiac: json["zodiac"],
        height: json["height"],
        weight: json["weight"],
        interests: json["interests"] != null
            ? List<String>.from(json["interests"].map((x) => x))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "username": username,
        "name": name,
        "birthday": birthday,
        "horoscope": horoscope,
        "zodiac": zodiac,
        "height": height,
        "weight": weight,
        "interests": interests != null
            ? List<dynamic>.from(interests!.map((x) => x))
            : null,
      };
}
