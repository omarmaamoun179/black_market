import 'datum.dart';

class ArticelsDetails {
  int? currentPage;
  List<DatumArticlesDetails>? data;
  String? firstPageUrl;
  int? from;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;

  ArticelsDetails({
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

  factory ArticelsDetails.fromJson(Map<String, dynamic> json) {
    return ArticelsDetails(
      currentPage: json['current_page'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DatumArticlesDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstPageUrl: json['first_page_url'] as String?,
      from: json['from'] as int?,
      nextPageUrl: json['next_page_url'] as dynamic,
      path: json['path'] as String?,
      perPage: json['per_page'] as int?,
      prevPageUrl: json['prev_page_url'] as dynamic,
      to: json['to'] as int?,
    );
  }

}
