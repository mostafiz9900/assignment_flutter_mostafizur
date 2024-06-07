// To parse this JSON data, do
//
//     final regRequest = regRequestFromMap(jsonString);

import 'dart:convert';

RegRequest regRequestFromMap(String str) => RegRequest.fromMap(json.decode(str));

String regRequestToMap(RegRequest data) => json.encode(data.toMap());

class RegRequest {
  final String? username;
  final String? email;
  final String? password;

  RegRequest({
    this.username,
    this.email,
    this.password,
  });

  factory RegRequest.fromMap(Map<String, dynamic> json) => RegRequest(
    username: json["username"],
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toMap() => {
    "username": username,
    "email": email,
    "password": password,
  };
}
