import 'price.dart';

class GoldsModel {
  int? id;
  String? icon;
  String? name;
  String? karat;
  int? sort;
  dynamic createdAt;
  String? updatedAt;
  Price? price;

  GoldsModel({
    this.id,
    this.icon,
    this.name,
    this.karat,
    this.sort,
    this.createdAt,
    this.updatedAt,
    this.price,
  });

  factory GoldsModel.fromJson(Map<String, dynamic> json) => GoldsModel(
        id: json['id'] as int?,
        icon: json['icon'] as String?,
        name: json['name'] as String?,
        karat: json['karat'] as String?,
        sort: json['sort'] as int?,
        createdAt: json['created_at'] as dynamic,
        updatedAt: json['updated_at'] as String?,
        price: json['price'] == null
            ? null
            : Price.fromJson(json['price'] as Map<String, dynamic>),
      );
}
