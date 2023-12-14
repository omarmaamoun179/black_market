import 'comment.dart';

class DatumArticlesDetails {
  int? id;
  String? thumbnail;
  String? banner;
  String? title;
  String? shortDescription;
  String? description;
  int? draft;
  DateTime? createdAt;
  String? updatedAt;
  List<Comment>? comments;
  int? readsCount;

  DatumArticlesDetails({
    this.id,
    this.thumbnail,
    this.banner,
    this.title,
    this.shortDescription,
    this.description,
    this.draft,
    this.createdAt,
    this.updatedAt,
    this.comments,
    this.readsCount,
  });

  factory DatumArticlesDetails.fromJson(Map<String, dynamic> json) => DatumArticlesDetails(
        id: json['id'] as int?,
        thumbnail: json['thumbnail'] as String?,
        banner: json['banner'] as String?,
        title: json['title'] as String?,
        shortDescription: json['short_description'] as String?,
        description: json['description'] as String?,
        draft: json['draft'] as int?,
        createdAt: json['created_at'] == null ? null : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] as String?,
        comments: (json['comments'] as List<dynamic>?)
            ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
            .toList(),
        readsCount: json['reads_count'] as int?,
      );

 
}
