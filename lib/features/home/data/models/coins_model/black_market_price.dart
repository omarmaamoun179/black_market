class BlackMarketPrice {
  int? id;
  int? currencyId;
  double? buyPrice;
  double? sellPrice;
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
