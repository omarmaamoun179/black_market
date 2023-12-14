class DatumNots {
  int? id;
  String? topic;
  String? title;
  String? body;
  DateTime? scheduleAt;
  dynamic appId;
  int? showToUsers;
  dynamic articleId;
  dynamic link;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? readsCount;
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
