import 'user.dart';

class RegisterModel {
  User? user;
  String? accessToken;
  String? expiresAt;

  RegisterModel({this.user, this.accessToken, this.expiresAt});

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        accessToken: json['access_token'] as String?,
        expiresAt: json['expires_at'] as String?,
      );

 
}
