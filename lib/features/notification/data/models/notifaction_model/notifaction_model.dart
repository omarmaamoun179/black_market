import 'package:hive/hive.dart';

import 'datum.dart';
part 'notifaction_model.g.dart';

@HiveType(typeId: 6)
class NotifactionModel {
  @HiveField(0)
  int? currentPage;
  @HiveField(1)
  List<DatumNots>? data;
  @HiveField(2)
  String? firstPageUrl;
  @HiveField(3)
  int? from;
  @HiveField(4)
  String? nextPageUrl;
  @HiveField(5)
  String? path;
  @HiveField(6)
  int? perPage;
  @HiveField(7)
  dynamic prevPageUrl;
  @HiveField(8)
  int? to;

  NotifactionModel({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
  });

  factory NotifactionModel.fromJson(Map<String, dynamic> json) {
    return NotifactionModel(
      currentPage: json['current_page'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DatumNots.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstPageUrl: json['first_page_url'] as String?,
      from: json['from'] as int?,
      nextPageUrl: json['next_page_url'] as String?,
      path: json['path'] as String?,
      perPage: json['per_page'] as int?,
      prevPageUrl: json['prev_page_url'] as dynamic,
      to: json['to'] as int?,
    );
  }
}
