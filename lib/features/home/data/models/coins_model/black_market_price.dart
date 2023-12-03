class BlackMarketPrice {
  int? id;
  int? currencyId;
  dynamic? buyPrice;
  dynamic? sellPrice;
  String? date;
  int? hour;
  DateTime? createdAt;
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
      buyPrice: json['buy_price'] ,
      sellPrice: json['sell_price'] ,
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

  Map<String, dynamic> toJson() => {
        'id': id,
        'currency_id': currencyId,
        'buy_price': buyPrice,
        'sell_price': sellPrice,
        'date': date,
        'hour': hour,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}
