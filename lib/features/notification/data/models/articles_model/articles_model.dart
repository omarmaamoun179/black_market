import 'datum.dart';

class ArticlesModel {
  int? currentPage;
  List<DatumArticles>? data;
  String? firstPageUrl;
  int? from;
  String? nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;

  ArticlesModel({
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

  factory ArticlesModel.fromJson(Map<String, dynamic> json) => ArticlesModel(
        currentPage: json['current_page'] as int?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => DatumArticles.fromJson(e as Map<String, dynamic>))
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
