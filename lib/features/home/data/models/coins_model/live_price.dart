
import 'package:hive/hive.dart';
part 'live_price.g.dart';

@HiveType(typeId: 3)
class LivePrice {
  @HiveField(0)
  int? id;
  @HiveField(1)
  int? currencyId;
  @HiveField(2)
  String? date;
  @HiveField(3)
  int? hour;
  double? price;
  @HiveField(4)
  DateTime? createdAt;
  @HiveField(5)
  DateTime? updatedAt;

  LivePrice({
    this.id,
    this.currencyId,
    this.date,
    this.hour,
    this.price,
    this.createdAt,
    this.updatedAt,
  });

  factory LivePrice.fromJson(Map<String, dynamic> json) => LivePrice(
        id: json['id'] as int?,
        currencyId: json['currency_id'] as int?,
        date: json['date'] as String?,
        hour: json['hour'] as int?,
        price: (json['price'] as num?)?.toDouble(),
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      );
}
