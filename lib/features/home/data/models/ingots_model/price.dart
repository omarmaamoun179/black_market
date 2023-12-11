class Price {
  int? id;
  int? goldIngotId;
  double? buyPrice;
  double? sellPrice;
  DateTime? createdAt;
  DateTime? updatedAt;

  Price({
    this.id,
    this.goldIngotId,
    this.buyPrice,
    this.sellPrice,
    this.createdAt,
    this.updatedAt,
  });

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        id: json['id'] as int?,
        goldIngotId: json['gold_ingot_id'] as int?,
        buyPrice: (json['buy_price'] as num?)?.toDouble(),
        sellPrice: (json['sell_price'] as num?)?.toDouble(),
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'gold_ingot_id': goldIngotId,
        'buy_price': buyPrice,
        'sell_price': sellPrice,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}
