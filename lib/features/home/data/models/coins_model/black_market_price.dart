import 'package:hive/hive.dart';
part 'black_market_price.g.dart';

@HiveType(typeId: 4)
class BlackMarketPrice {
  @HiveField(0)
  int? id;
  @HiveField(1)
  int? currencyId;
  @HiveField(2)
  double? buyPrice;
  @HiveField(3)
  double? sellPrice;
  @HiveField(4)
  String? date;
  @HiveField(5)
  int? hour;
  @HiveField(6)
  DateTime? createdAt;
  @HiveField(7)
  DateTime? updatedAt;

  BlackMarketPrice({
    this.id,
    this.currencyId,
    this.buyPrice,
    this.sellPrice,
    this.date,
    this.hour,
    this.createdAt,
    this.updatedAt,
  });

  factory BlackMarketPrice.fromJson(Map<String, dynamic> json) {
    return BlackMarketPrice(
      id: json['id'] as int?,
      currencyId: json['currency_id'] as int?,
      buyPrice: (json['buy_price'] as num?)?.toDouble(),
      sellPrice: (json['sell_price'] as num?)?.toDouble(),
      date: json['date'] as String?,
      hour: json['hour'] as int?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );
  }
}
