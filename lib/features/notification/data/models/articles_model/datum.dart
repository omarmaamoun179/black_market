class DatumArticles {
  int? id;
  String? thumbnail;
  String? banner;
  String? title;
  String? shortDescription;
DateTime? createdAt;

  DatumArticles({
    this.id,
    this.thumbnail,
    this.banner,
    this.title,
    this.shortDescription,
    this.createdAt,
  });

  factory DatumArticles.fromJson(Map<String, dynamic> json) => DatumArticles(
        id: json['id'] as int?,
        thumbnail: json['thumbnail'] as String?,
        banner: json['banner'] as String?,
        title: json['title'] as String?,
        shortDescription: json['short_description'] as String?,
        createdAt: json['created_at'] ==null?null:DateTime.parse(json['created_at']),
      );
}
