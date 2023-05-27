import 'dart:convert';

import 'package:myflix/src/features/data.dart';

class LoginResponse {
  final String? token;
  final String? tokenType;
  final UserResponse? user;

  LoginResponse({
    this.token,
    this.tokenType,
    this.user,
  });

  factory LoginResponse.fromRawJson(String str) =>
      LoginResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        token: json["token"],
        tokenType: json["token_type"],
        user: json["user"] == null ? null : UserResponse.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "token_type": tokenType,
        "user": user?.toJson(),
      };
}
