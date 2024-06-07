import 'dart:convert';

class LoginRequest {
  LoginRequest({
    required this.userName,
    required this.password,
  });

  String userName;
  String password;

  factory LoginRequest.fromRawJson(String str) =>
      LoginRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
    userName: json["username"],
    password: json["password"],

  );

  Map<String, dynamic> toJson() => {
    "username": userName,
    "password": password
  };
}