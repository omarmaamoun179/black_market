import 'user.dart';

class LoginModel {
  User? user;
  String? accessToken;
  String? expiresAt;

  LoginModel({this.user, this.accessToken, this.expiresAt});

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        accessToken: json['access_token'] as String?,
        expiresAt: json['expires_at'] as String?,
      );
}
