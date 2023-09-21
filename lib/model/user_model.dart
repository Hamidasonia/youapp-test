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
  String name;
  String birthday;
  String horoscope;
  String zodiac;
  int height;
  int weight;
  List<String> interests;

  Data({
    required this.email,
    required this.username,
    required this.name,
    required this.birthday,
    required this.horoscope,
    required this.zodiac,
    required this.height,
    required this.weight,
    required this.interests,
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
    interests: List<String>.from(json["interests"].map((x) => x)),
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
    "interests": List<dynamic>.from(interests.map((x) => x)),
  };
}
