import 'dart:convert';

// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromMap(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromMap(String str) => LoginResponse.fromMap(json.decode(str));

String loginResponseToMap(LoginResponse data) => json.encode(data.toMap());

class LoginResponse {
  final String? token;
  final String? userEmail;
  final String? userNicename;
  final String? userDisplayName;

  LoginResponse({
    this.token,
    this.userEmail,
    this.userNicename,
    this.userDisplayName,
  });

  factory LoginResponse.fromMap(Map<String, dynamic> json) => LoginResponse(
    token: json["token"],
    userEmail: json["user_email"],
    userNicename: json["user_nicename"],
    userDisplayName: json["user_display_name"],
  );

  Map<String, dynamic> toMap() => {
    "token": token,
    "user_email": userEmail,
    "user_nicename": userNicename,
    "user_display_name": userDisplayName,
  };
}
