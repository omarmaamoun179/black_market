import 'package:hive/hive.dart';
part 'bank_price.g.dart';

@HiveType(typeId: 5)
class BankPrice {
  @HiveField(0)
  int? id;
  @HiveField(1)
  int? bankId;
  @HiveField(2)
  int? currencyId;
  @HiveField(3)
  double? buyPrice;
  @HiveField(4)
  double? sellPrice;
  @HiveField(5)
  String? date;
  @HiveField(6)
  String? createdAt;
  @HiveField(7)
  String? updatedAt;

  BankPrice({
    this.id,
    this.bankId,
    this.currencyId,
    this.buyPrice,
    this.sellPrice,
    this.date,
    this.createdAt,
    this.updatedAt,
  });

  factory BankPrice.fromJson(Map<String, dynamic> json) => BankPrice(
        id: json['id'] as int?,
        bankId: json['bank_id'] as int?,
        currencyId: json['currency_id'] as int?,
        buyPrice: (json['buy_price'] as num?)?.toDouble(),
        sellPrice: (json['sell_price'] as num?)?.toDouble(),
        date: json['date'] as String?,
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
      );
}
