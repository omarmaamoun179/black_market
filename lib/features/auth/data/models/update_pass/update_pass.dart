import 'user.dart';

class UpdatePassModel {
  User? user;
  String? accessToken;
  String? expiresAt;

  UpdatePassModel({this.user, this.accessToken, this.expiresAt});

  factory UpdatePassModel.fromJson(Map<String, dynamic> json) =>
      UpdatePassModel(
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        accessToken: json['access_token'] as String?,
        expiresAt: json['expires_at'] as String?,
      );
}
