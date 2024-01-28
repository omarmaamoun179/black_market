import 'package:hive/hive.dart';

part 'datum.g.dart';

@HiveType(typeId: 7)
class DatumNots {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? topic;
  @HiveField(2)
  String? title;
  @HiveField(3)
  String? body;
  @HiveField(4)
  DateTime? scheduleAt;
  @HiveField(5)
  dynamic appId;
  @HiveField(6)
  int? showToUsers;
  @HiveField(7)
  dynamic articleId;
  @HiveField(8)
  dynamic link;
  @HiveField(9)
  DateTime? createdAt;
  @HiveField(10)
  DateTime? updatedAt;
  @HiveField(11)
  int? readsCount;
  @HiveField(12)
  String? notificationDate;

  DatumNots({
    this.id,
    this.topic,
    this.title,
    this.body,
    this.scheduleAt,
    this.appId,
    this.showToUsers,
    this.articleId,
    this.link,
    this.createdAt,
    this.updatedAt,
    this.readsCount,
    this.notificationDate,
  });

  factory DatumNots.fromJson(Map<String, dynamic> json) => DatumNots(
        id: json['id'] as int?,
        topic: json['topic'] as String?,
        title: json['title'] as String?,
        body: json['body'] as String?,
        scheduleAt: json['schedule_at'] == null
            ? null
            : DateTime.parse(json['schedule_at'] as String),
        appId: json['app_id'] as dynamic,
        showToUsers: json['show_to_users'] as int?,
        articleId: json['article_id'] as dynamic,
        link: json['link'] as dynamic,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        readsCount: json['reads_count'] as int?,
        notificationDate: json['notification_date'] as String?,
      );
}
