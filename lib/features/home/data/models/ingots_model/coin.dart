import 'companies_datum.dart';
import 'price.dart';

class Coin {
  int? id;
  int? baseGoldItem;
  String? icon;
  String? name;
  String? karat;
  int? weight;
  int? sort;
  String? createdAt;
  String? updatedAt;
  List<CompaniesDatum>? companiesData;
  Price? price;

  Coin({
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

  factory Coin.fromJson(Map<String, dynamic> json) => Coin(
        id: json['id'] as int?,
        baseGoldItem: json['base_gold_item'] as int?,
        icon: json['icon'] as String?,
        name: json['name'] as String?,
        karat: json['karat'] as String?,
        weight: json['weight'] as int?,
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
