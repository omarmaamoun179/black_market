class Price {
  int? id;
  int? goldId;
  int? currencyId;
  String? date;
  int? hour;
  double? price;
  double? buyPrice;
  DateTime? createdAt;
  DateTime? updatedAt;

  Price({
    this.id,
    this.goldId,
    this.currencyId,
    this.date,
    this.hour,
    this.price,
    this.buyPrice,
    this.createdAt,
    this.updatedAt,
  });

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        id: json['id'] as int?,
        goldId: json['gold_id'] as int?,
        currencyId: json['currency_id'] as int?,
        date: json['date'] as String?,
        hour: json['hour'] as int?,
        price: (json['price'] as num?)?.toDouble(),
        buyPrice: (json['buy_price'] as num?)?.toDouble(),
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      );
}
