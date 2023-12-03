class User {
  int? id;
  int? roleId;
  String? name;
  String? email;
  String? avatar;
  dynamic emailVerifiedAt;
  dynamic token;
  dynamic provider;
  List<dynamic>? settings;
  String? otp;
  DateTime? createdAt;
  DateTime? updatedAt;

  User({
    this.id,
    this.roleId,
    this.name,
    this.email,
    this.avatar,
    this.emailVerifiedAt,
    this.token,
    this.provider,
    this.settings,
    this.otp,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as int?,
        roleId: json['role_id'] as int?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        avatar: json['avatar'] as String?,
        emailVerifiedAt: json['email_verified_at'] as dynamic,
        token: json['token'] as dynamic,
        provider: json['provider'] as dynamic,
        settings: json['settings'] as List<dynamic>?,
        otp: json['otp'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      );
}
