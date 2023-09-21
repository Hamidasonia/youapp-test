class ResponseModel {
  String message;

  ResponseModel({
    required this.message,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}
