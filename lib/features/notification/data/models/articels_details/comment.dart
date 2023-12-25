class Comment {
  int? id;
  int? articleId;
  int? userId;
  String? comment;
  dynamic replyingToComment;
  int? anonymously;
  String? createdAt;
  String? updatedAt;
  int? lft;
  int? rgt;
  dynamic parentId;
  int? likesCount;
  int? descendantsCount;
  bool? likedExists;
  String? userName;
  dynamic replyingToUser;
  dynamic latestReply;

  Comment({
    this.id,
    this.articleId,
    this.userId,
    this.comment,
    this.replyingToComment,
    this.anonymously,
    this.createdAt,
    this.updatedAt,
    this.lft,
    this.rgt,
    this.parentId,
    this.likesCount,
    this.descendantsCount,
    this.likedExists,
    this.userName,
    this.replyingToUser,
    this.latestReply,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json['id'] as int?,
        articleId: json['article_id'] as int?,
        userId: json['user_id'] as int?,
        comment: json['comment'] as String?,
        replyingToComment: json['replying_to_comment'] as dynamic,
        anonymously: json['anonymously'] as int?,
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
        lft: json['_lft'] as int?,
        rgt: json['_rgt'] as int?,
        parentId: json['parent_id'] as dynamic,
        likesCount: json['likes_count'] as int?,
        descendantsCount: json['descendants_count'] as int?,
        likedExists: json['liked_exists'] as bool?,
        userName: json['user_name'] as String?,
        replyingToUser: json['replying_to_user'] as dynamic,
        latestReply: json['latest_reply'] as dynamic,
      );
}
