import 'companies_datum.dart';
import 'price.dart';

class Ingot {
  int? id;
  int? baseGoldItem;
  dynamic icon;
  String? name;
  String? karat;
  double? weight;
  int? sort;
  String? createdAt;
  String? updatedAt;
  List<CompaniesDatum>? companiesData;
  Price? price;

  Ingot({
    this.id,
    this.baseGoldItem,
    this.icon,
    this.name,
    this.karat,
    this.weight,
    this.sort,
    this.createdAt,
    this.updatedAt,
    this.companiesData,
    this.price,
  });

  factory Ingot.fromJson(Map<String, dynamic> json) => Ingot(
        id: json['id'] as int?,
        baseGoldItem: json['base_gold_item'] as int?,
        icon: json['icon'] as dynamic,
        name: json['name'] as String?,
        karat: json['karat'] as String?,
        weight: (json['weight'] as num?)?.toDouble(),
        sort: json['sort'] as int?,
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
        companiesData: (json['companies_data'] as List<dynamic>?)
            ?.map((e) => CompaniesDatum.fromJson(e as Map<String, dynamic>))
            .toList(),
        price: json['price'] == null
            ? null
            : Price.fromJson(json['price'] as Map<String, dynamic>),
      );

}
