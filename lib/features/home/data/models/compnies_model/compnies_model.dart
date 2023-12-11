class CompniesModel {
  int? id;
  String? image;
  String? name;
  String? key;
  int? active;
  DateTime? createdAt;
  DateTime? updatedAt;

  CompniesModel({
    this.id,
    this.image,
    this.name,
    this.key,
    this.active,
    this.createdAt,
    this.updatedAt,
  });

  factory CompniesModel.fromJson(Map<String, dynamic> json) => CompniesModel(
        id: json['id'] as int?,
        image: json['image'] as String?,
        name: json['name'] as String?,
        key: json['key'] as String?,
        active: json['active'] as int?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      );
}
