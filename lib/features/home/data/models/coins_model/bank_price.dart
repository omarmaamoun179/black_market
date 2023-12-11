class BankPrice {
  int? id;
  int? bankId;
  int? currencyId;
  double? buyPrice;
  double? sellPrice;
  String? date;
  String? createdAt;
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
